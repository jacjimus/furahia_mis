<?php
if (isset($_POST)) {
    ?>
<?php
$this->widget('application.extensions.print.printWidget', array(
    'cssFile' => 'print.css',
    'printedElement' => '#printable',
));
?>

<div id="printable">
    <?php
     $start = $_POST['start'].'%';
     $end = $_POST['end'].'%';
     $status = $_POST['status'];
     $short_code = $_POST['short_code'] <> "" ? $_POST['short_code']: 'All' ;
     $type = $status == 1? 'Subscription' : "Un-Subscription";
     $command = Yii::app()->db->createCommand("call sdp.weekly_sync('$start' , '$end', '$status', '$short_code')");
    
  
                
                if ($command)
                    {
 $total = 0;
 $total_gross  = 0;
 $total_net  = 0;
 $new  = 0;
 $unsubs  = 0;
 $terms  = 0;
        
        ?>
        <div style="text-align:left; background-color: white; border: solid 1px #9BB5C1;  padding: 10px;"  title="Reports">
            <h3><?=$type ?> Report for <?=$short_code?> short code from date <?=$start?> to date <?=$end?></h3><br />
            
            <table width="100%" style="font-size: 14px !important;" >
                <tr height="40px">
                    <td>
                        <b>Subscription Date</b>
                    </td>
                    
                    <td align="left" >
                        <b>Service Name</b>
                    </td>

                    <td style=" text-align: center" >
                        <b>Short Code</b>
                    </td>
                    <td style=" text-align: right" >
                        <b>Total Subs</b>
                    </td>
                </tr>
                <?php
                     //   var_dump($sync)
                     foreach($command->queryAll() As $val)
                     {
                        ?>

                        <tr>
                            <td class="row" >
                        <?php
                        echo date("D, d-M-Y", strtotime($val['date']));
                        ?>
                            </td>
                           
                            <td class="row" style="font-weight: 550; text-align: left" >
                                <?php
                                echo $val['service_name'];
                                ?>
                            </td>
                            <td class="row" style="font-weight: 550; text-align: center" >
                                <?php
                                echo $val['short_code'];
                                ?>
                            </td>

                            <td class="row" style="font-weight: 550; text-align: right" >
            <?php
                              echo $count = $val['count'];
            ?>
                            </td>
                            

                        </tr>
                        <tr>
                            <td colspan="4"><hr></td>
                        </tr>



        <?php 
       
        $new  += $count;
        
                    }
    ?>
                        <tr style="font-weight: bold;">
                            <td style="text-align: center;font-weight: bold; " colspan="3">
                                Total Subscriptions : 
                            </td>
                            <td style="text-align: right;font-weight: bold;">
                                <?=  number_format($new,0,'.',',')?>
                            </td>
                            
                            
                            
                        </tr>
                </table>

            </div>     <?php
        $this->widget('application.extensions.print.printWidget', array(
            'cssFile' => 'print.css',
            'printedElement' => '#printable',
        ));
        ?>

    <?php
    } 
    else
        echo "<font style='flash'>No records found!</font>";

?>

<script language="javascript" type="text/javascript">

    $(document).ready(function() {
        $(".collapsibleContainer").collapsiblePanel();

    });
</script> 

<?php
}