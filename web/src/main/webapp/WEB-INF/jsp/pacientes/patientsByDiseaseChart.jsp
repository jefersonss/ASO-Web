<script src="https://code.highcharts.com/highcharts.js"></script>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a data-toggle="collapse" data-parent="#accordion" href="#collapse3" id="collapseGraph">Pacientes por diagnóstico</a>
		</h4>
	</div>
	<div id="collapse3" class="panel-collapse collapse">
		<div id="container" style="height: 400px; margin: 0 auto"></div>
	</div>
</div>


<script>
var keyData = new Array(getStringValuesFromArray(${keysArray}));
var valueData = ${valuesArray};
var graphData = new Array();

for(i = 0; i < keyData.length; i++ ){
	graphData[graphData.length] = {name: keyData[i], y:valueData[i]};
}

$(function () {

    $(document).ready(function () {

        // Build the chart
        $('#container').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Pacientes por diagnóstico'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Pacientes por Diagnóstico',
                colorByPoint: true,
                data: graphData
            }]
        });
    });
});
</script>