<script type="text/javascript">
    function getDailyReports()
    {
    var d_date = $("#Syncorder_d_date").val();
    var d_short_code = $("#Syncorder_d_short_code").val();
    var d_status = $("#Syncorder_d_status").val();
    if(d_status == "")
    {
        alert('Please select sub type');
        return false;
    }
    var values =  'd_date=' + d_date +  "&d_short_code=" + d_short_code + "&d_status=" + d_status + '&cache=' + Math.random();
 // Preloder for generating Reports JM 
$('#daily_reports').show();
$('#daily_reports').html("<img src= '<?php echo Yii::app()->request->baseUrl ?>/themes/default/images/ajax-loader.gif '/>   Please wait...   ");
   $.ajax
({
type: "POST",
url: "showSubReports",
data: values,
cache: false,
success: function(html)
{
$("#daily_reports").html(html);

}
});

};
    function getWeeklyReports()
    {
    var start = $("#Syncorder_w_start").val();
    var  end = $("#Syncorder_w_end").val();
    var  status = $("#Syncorder_w_status").val();
    var  short_code = $("#Syncorder_w_short_code").val();
    if(status == "")
    {
        alert('Please select sub type');
        return false;
    }
    var values =  'start=' + start +  "&end=" + end +  "&status=" + status +"&short_code=" + short_code + '&cache=' + Math.random();
 // Preloder for generating Reports JM 
$('#weekly_reports').show();
$('#weekly_reports').html("<img src= '<?php echo Yii::app()->request->baseUrl ?>/themes/default/images/ajax-loader.gif '/>   Please wait...   ");
   $.ajax
({
type: "POST",
url: "weeklySubs",
data: values,
cache: false,
success: function(html)
{
$("#weekly_reports").html(html);

}
});

};
    function getCustomReports()
    {
    var start = $("#Syncorder_c_start").val();
    var status = $("#Syncorder_c_status").val();
    var end = $("#Syncorder_c_end").val();
    var  report = $("#Syncorder_report_name").val();
    var values =  'start=' + start + '&end=' + end + "&status=" + status + "&report=" + report + '&cache=' + Math.random();
 // Preloder for generating Reports JM 
$('#custome_reports').show();
$('#custome_reports').html("<img src= '<?php echo Yii::app()->request->baseUrl ?>/themes/default/images/ajax-loader.gif '/>   Please wait...   ");
   $.ajax
({
type: "POST",
url: "CustomSubs",
data: values,
cache: false,
success: function(html)
{
$("#custome_reports").html(html);

}
});

};
    function getMonthlyReports()
    {
    var year = $("#Syncorder_year").val();
    var month = $("#Syncorder_month").val();
    var status = $("#Syncorder_m_status").val();
    var short_code = $("#Syncorder_m_short_code").val();
    if(status == "")
    {
        alert('Please select sub type');
        return false;
    }
    var values =  'year=' + year + '&month=' + month + "&short_code=" +  short_code + "&status=" + status + '&cache=' + Math.random();
 // Preloder for generating Reports JM 
$('#monthly_reports').show();
$('#monthly_reports').html("<img src= '<?php echo Yii::app()->request->baseUrl ?>/themes/default/images/ajax-loader.gif '/>   Please wait...   ");
   $.ajax
({
type: "POST",
url: "monthlySubs",
data: values,
cache: false,
success: function(html)
{
$("#monthly_reports").html(html);

}
});

};


                    $(function() {
                        $("#tabs").tabs();
                    });
               
</script>
