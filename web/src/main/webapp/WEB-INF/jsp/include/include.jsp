<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>

<fmt:setBundle basename="messages"/>

<head>
	<title>ASO Web View</title>
</head>

<link href="/web/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/web/resources/css/theme.css" rel="stylesheet">
<script src="/web/resources/js/jquery/1.11.0/jquery.min.js"></script>
<script src="/web/resources/js/bootstrap.min.js"></script>

<script type="text/javascript">
function convertDateArrayToString(dateArray){
	var formatedDates = new Array();
	for(i = 0; i < dateArray.length; i++){
		formattedDates[i] = dateToString(dateArray[i]);
	}
	return formattedDates;
}

function dateToString(date){
	var day = date.getDate();
	var month = date.getMonth();
	var year = date.getFullYear();
	
	return day + '/' + month + '/' + year;
}

function getStringValuesFromArray(array){
	array = array.replace("[", "").replace("]", "");
	return array.split(",");
}
</script>