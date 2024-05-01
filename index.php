<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style type="text/css">
        .chartBox{
            width: 700px;
            margin: 0 auto;
            border: 1px ;
        }
    </style>
</head>
<body>
<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);
require "./conn.php";
try {
        //displaying
        $sql = "SELECT TIME(gtr.timestamp) AS time, gtr.temperature FROM grace_temperature_record gtr";
        $res = $pdo->query($sql);
        if($res->rowCount()>0){
            $devices=array();
            $temperatures=array();
            while($row = $res->fetch()){
                $devices[] = $row["time"];
                $temperatures[] = (float)$row["temperature"];
            };
            unset($res);
        }else{
            echo "No records matching your query";
        }
        //Inserting
        $tempFromPostman = $_POST["temperature"];
        $deviceFromPostman = $_POST["device"];

        if($deviceFromPostman&&$tempFromPostman){
         $getDeviceIdQuery = "SELECT device_uid FROM grace_device WHERE device_name='$deviceFromPostman'";

            $deviceId = $pdo->query($getDeviceIdQuery);

            if($deviceId->rowCount()==0){
                $insertNewDevice = "INSERT INTO grace_device(device_name) VALUES('$deviceFromPostman')";
                $pdo->exec($insertNewDevice);
                $newDeviceId=$pdo->lastInsertId();
                $insertNewRecord = "INSERT INTO grace_temperature_record(temperature, device_ref) VALUES($tempFromPostman, $newDeviceId)";
                $pdo->exec($insertNewRecord);
                echo "Added new record with New Device!";
                }

            if($deviceId->rowCount()>0){
                while($row = $deviceId->fetch()){
                    $id=$row["device_uid"];
                }
            $insertNewRecord = "INSERT INTO grace_temperature_record(temperature, device_ref) VALUES($tempFromPostman, $id)";
            $pdo->exec($insertNewRecord);
            echo "Added new record with already-inserted Device!";
            unset($deviceId);
        }
    }else{
        echo "Please fill in both the temperature and the device";
    }
}catch (PDOException $e) {
    die("ERROR: Couldn't retrieve". $e->getMessage());
}



//close the connection
unset($pdo);
?>

<div class="chartBox">
    <canvas id="myChart"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    //Setup block
    const devices=<?php echo json_encode($devices);?>;
    const temps=<?php echo json_encode($temperatures);?>;
    const xmlHttpRequest = new XMLHttpRequest()

    setInterval(function (){        
    xmlHttpRequest.open("get","index.php")
    xmlHttpRequest.send()
    }, 1000)
    const data={    
        labels: [...devices],
        datasets: [{
                label: 'Temps vs. devices',
                data: [...temps],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
        }]
    } 
    //Config block
    const config={
        type: 'bar',
    data,
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
    }
    //Render block
    const myChart = new Chart(document.getElementById('myChart'), config);
</script>
 
</body>
</html>