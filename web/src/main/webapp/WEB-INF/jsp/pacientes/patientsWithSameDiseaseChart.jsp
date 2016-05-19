<script src="https://www.highcharts.com/samples/static/highslide-full.min.js"></script>
<script src="https://www.highcharts.com/samples/static/highslide.config.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="https://www.highcharts.com/samples/static/highslide.css" />

<div class="panel panel-primary">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Pacientes com mesma medicação e diagnóstico</a>
		</h4>
	</div>
	<div id="collapse5" class="panel-collapse collapse">
		<div id="containerSameDiagnosis" style="height: 400px; margin: 0 auto"></div>
	</div>
</div>

<script>
var patientsWithSameDiagnosis = new Array();
var patientsWithSameMedication = new Array();
</script>

<c:forEach items="${patientsSameDiagnosis}" var="paciente">
	<script>patientsWithSameDiagnosis[patientsWithSameDiagnosis.length] = '${paciente.name}';</script>
</c:forEach>

<c:forEach items="${patientsSameMedication}" var="paciente">
	<script>patientsWithSameMedication[patientsWithSameMedication.length] = '${paciente.name}';</script>
</c:forEach>

<div class="highslide-html-content" id="patientsWithSameDiagnosis" onclick="return hs.close()">
	<div class="highslide-header"></div>
	<div style="padding: 0px; border: none; margin: 0px; overflow: auto; width: 199px; height: 46px; position: relative;">
		<div class="highslide-body">
			<div class="highslide-maincontent" style="display: block;">
				<c:forEach items="${patientsSameDiagnosis}" var="paciente">${paciente.name}</c:forEach>
			</div>
		</div>
	</div>
</div>

<div class="highslide-html-content" id="patientsWithSameMedication" onclick="return hs.close()">
	<div class="highslide-header"></div>
	<div style="padding: 0px; border: none; margin: 0px; overflow: auto; width: 199px; height: 46px; position: relative;">
		<div class="highslide-body">
			<div class="highslide-maincontent" style="display: block;">
				<c:forEach items="${patientsSameMedication}" var="paciente">${paciente.name}</c:forEach>
			</div>
		</div>
	</div>
</div>

<script>
$(function() {
	$('#containerSameDiagnosis')
		.highcharts({
			chart : {
				type : 'column'
			},
			title : {
				text : 'Pacientes com mesmo diagnóstico e mesma medicação'
			},
			subtitle : {
				text : 'ASO'
			},
			xAxis : {
				visible: false
			},
			yAxis : {
				min : 0,
				allowDecimals: false,
				title : {
					text : 'Número de pacientes'
				}
			},
			plotOptions : {
				column : {
					pointPadding : 0.2,
					borderWidth : 0
				}
			},
			series : [ {
				name : 'Pacientes com o mesmo diagnóstico',
				data : [patientsWithSameDiagnosis.length], 
				tooltip : {
					headerFormat : '<table>',
					pointFormat : '<tr><td style="color:{series.color};padding:0">Clique para expandir</td></tr>',
					footerFormat : '</table>',
					shared : false,
					useHTML : true
				},
				events: {
					click: function (e) {
						hs.close(),
                		hs.htmlExpand(null, {
                        	pageOrigin: {
                            	x: e.pageX || e.clientX,
                                y: e.pageY || e.clientY
							},
							headingText: 'Pacientes',
							contentId: 'patientsWithSameDiagnosis',
							width: 200
						});
					}
				}
			}, {
				name : 'Pacientes tomando a mesma medicação',
				data : [patientsWithSameMedication.length], 
				tooltip : {
					headerFormat : '<table>',
					pointFormat : '<tr><td style="color:{series.color};padding:0">Clique para expandir</td></tr>',
					footerFormat : '</table>',
					shared : false,
					useHTML : true
				},
				events: {
					click: function (e) {
						hs.close(),
						hs.htmlExpand(null, {
							pageOrigin: {
                            	x: e.pageX || e.clientX,
								y: e.pageY || e.clientY
							},
						headingText: 'Pacientes',
						contentId: 'patientsWithSameMedication',
						width: 200
						});
					}
				}
			}]
		});
});
</script>