$(function(){
  if($("#organization-data").length != 0){
    //return if pie chart div is not present
    $('.highchart-chart').each(function(){
      var chart_options = {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Teams Participation hours'
        },
        tooltip: {
            pointFormat: '<b>{point.y} hours</b>'
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
          name: 'Team Hours',
          data: $(this).siblings('.data').data('hours')
        }]
      } //end chart options
      
      var chart = Highcharts.chart(this.id, chart_options);
    }) //end each loop
  }//end if

})


// HACK to get highcharts centered on hidden containers where no height/width is available,
// see http://stackoverflow.com/questions/14954624/highcharts-does-not-resize-charts-inside-tabs
$(document).on( 'shown.bs.tab', 'a[data-toggle="tab"]', function () {
  $( '.highchart-chart' ).each(function() {
    $(this).highcharts().reflow();
  });
})