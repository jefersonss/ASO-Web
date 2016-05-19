<div class="panel panel-primary">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Evolu��o de Sinais Vitais</a>
		</h4>
	</div>
	<div id="collapse4" class="panel-collapse collapse">
		<div id="containerVitalSigns" style="height: 400px; margin: 0 auto"></div>
	</div>
</div>

<script>

dates = '${vitalSignExamsDates}';
dates = getStringValuesFromArray(dates);

$(function () {
    $('#containerVitalSigns').highcharts({
    	chart:{
    		width: 800
    	},
        title: {
            text: 'Evolu��o de Sinais Vitais',
            x: -20 //center
        },
        subtitle: {
            text: 'Display agregados de sinais vitais',
            x: -20
        },
        xAxis: {
            categories: dates
        },
        yAxis: {
            title: {
                text: 'Valores agregados'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Batimentos Card�acos',
            tooltip: {
                valueSuffix: 'bpm'
            },
            data: ${HeartRate}
        }, {
            name: 'Temperatura',
            tooltip: {
                valueSuffix: '�C'
            },
            data: ${Temperature}
        }, {
            name: 'Respira��es',
            tooltip: {
                valueSuffix: 'rpm'
            },
            data: ${Respirations}
        }, {
            name: 'SPO2',
            data: ${SPO2}
        }, {
        	name: 'BPS',
        	data: ${BPS}
        }, {
        	name: 'BPD',
        	data: ${BPD}
        }]
    });
});
</script>