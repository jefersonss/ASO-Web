package br.unisinos.aso.control;

import java.math.BigInteger;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.SetUtils;
import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import br.unisinos.aso.model.Patient;
import br.unisinos.aso.model.PatientInfo;

@Controller
@RequestMapping("/pacientes")
public class PacientesController {
	
	final static Logger logger = LoggerFactory.getLogger(PacientesController.class);
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request) throws Exception{
		ModelAndView retVal = new ModelAndView("pacientes/search");
		RestTemplate restTemplate = new RestTemplate();
		Map<String, List<Patient>> patientsByRoom = restTemplate.getForObject("http://127.0.0.1:9080/aso/patient", Map.class);
		Map<String, BigInteger> patientsByDisease = restTemplate.getForObject("http://127.0.0.1:9080/aso/patient/countByDisease", Map.class);
		List<String> keysArray = new LinkedList<String>();
		keysArray.addAll(patientsByDisease.keySet());
		try{
			retVal.addObject("ua", request.getHeader("User-Agent"));
			retVal.addObject("patientsByRoom", patientsByRoom);
			retVal.addObject("patientsByDisease", patientsByDisease);
			retVal.addObject("keysArray", "\""+keysArray+"\"");
			retVal.addObject("valuesArray", patientsByDisease.values());
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}	
		return retVal;
	}
	
//	@RequestMapping("/search")

	//	public ModelAndView search(@RequestParam("instanceCriteria") String instanceCriteria, HttpSession session) throws Exception{
//		ModelAndView retVal = new ModelAndView("pacientes/search");
//		
//		try{
//			Map<String, List<Patient>> instancesByCriteria = patientService.getPatients();
//			retVal.addObject("instancesByCriteria", instancesByCriteria);
//			retVal.addObject("instanceCriteria", instanceCriteria);
//		} catch (Exception e) {
//			logger.error(e.getMessage());
//			throw e;
//		}	
//		return retVal;
//	}
//	
	@RequestMapping(value="/{patientId}", method=RequestMethod.GET)
	public ModelAndView getPatientDetails(@PathVariable("patientId") Integer patientId, HttpSession session) throws Exception{
		ModelAndView retVal = new ModelAndView("pacientes/detail");
		
		try{
			RestTemplate restTemplate = new RestTemplate();
			Map<String, Integer> params = new HashMap<String, Integer>();
			params.put("id", patientId);
			
			PatientInfo patientInfo = restTemplate.getForObject("http://127.0.0.1:9080/aso/aggregated/retrieveObject/{id}", PatientInfo.class, params);
			
			DateTime lastDate = new DateTime(patientInfo.getPatient().getLastEnteredDate().getTime());
			
			retVal.addObject("lastEnteredDate", lastDate);
			retVal.addObject("paciente", patientInfo.getPatient());
			buildReturningValuesForVitalSigns(retVal, patientInfo.getVitalSignsExams());
			retVal.addObject("patientsSameDiagnosis", patientInfo.getTransformedInfo().getPatientsWithSameDiagnosis());
			retVal.addObject("patientsSameMedication", patientInfo.getTransformedInfo().getPatientsTakingSameMedication());
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}	
		return retVal;
	}

	private void buildReturningValuesForVitalSigns(ModelAndView retVal, Map<String, List<String>> vitalSignsExams) {
		Set<String> dateList = new LinkedHashSet<String>();
		for(String key : vitalSignsExams.keySet()){
			if(StringUtils.endsWith(key, "2")){
				List<String> dates = vitalSignsExams.get(key);
				dates.remove(0);
				dateList.addAll(dates);
				continue;
			}else{
				List<String> examResults = vitalSignsExams.get(key);
				examResults.remove(0);
				key = StringUtils.substringBefore(key, "1");
				retVal.addObject(StringUtils.deleteWhitespace(key), examResults);
			}
		}
		retVal.addObject("vitalSignExamsDates", dateList);
	}

}
