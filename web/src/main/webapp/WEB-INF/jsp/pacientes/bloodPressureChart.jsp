<script src="https://code.highcharts.com/highcharts.js"></script>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Histórico de Medidas de Pressão</a>
		</h4>
	</div>
	<div id="collapse2" class="panel-collapse collapse">
		<div id="container" style="height: 400px; margin: 0 auto"></div>
	</div>
</div>

<script>
var systolicResults = new Array();
var diastolicResults = new Array();
var examDates = new Array();
</script>

<c:forEach items="${paciente.treatment}" var="tratamento">
	<c:forEach items="${tratamento.exam}" var="exame">
		<c:choose>
			<c:when test="${exame.name.contains('systolic')}">
				<script>systolicResults[systolicResults.length] = ${exame.results};</script>
				<script>
					var examDate = new Date('${exame.date}');
					examDates[examDates.length] = dateToString(examDate);
				</script>
			</c:when>
			<c:when test="${exame.name.contains('diastolic')}">
				<script>diastolicResults[diastolicResults.length] = ${exame.results};</script>
			</c:when>
		</c:choose>
	</c:forEach>
</c:forEach>

<script>
	$(function() {
		$('#container')
				.highcharts(
						{
							chart : {
								type : 'column'
							},
							title : {
								text : 'Histórico Medidas de Pressão'
							},
							subtitle : {
								text : 'ASO'
							},
							xAxis : {
								categories : examDates,
								crosshair : true
							},
							yAxis : {
								min : 0,
								title : {
									text : 'Pressão alta e baixa'
								}
							},
							tooltip : {
								headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
								pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
										+ '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
								footerFormat : '</table>',
								shared : true,
								useHTML : true
							},
							plotOptions : {
								column : {
									pointPadding : 0.2,
									borderWidth : 0
								}
							},
							series : [ {
								name : 'Alta',
								data : diastolicResults

							}, {
								name : 'Baixa',
								data : systolicResults

							} ]
						});
	});
</script>