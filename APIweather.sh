#!/bin/bash
touch output.html

pathjson='ans.json'


data=$(curl "https://api.openweathermap.org/data/2.5/weather?lat=20.66&lon=-103.33&appid=4b8105e2c121c9cacadf98a85eaa73de&units=metric"
location="Guadalajara")

echo $data > $pathjson

        #Nombre
        echo "Location:  $(echo $data | jq .name | tr -d '"'),  $(echo $data | jq .sys.country | tr -d '"')"
        echo "Location:  $(echo $data | jq .name | tr -d '"'),  $(echo $data | jq .sys.country | tr -d '"')"  > 'output.html'
        #Temperatura
        echo " Temperature:  $(echo $data | jq .main.temp) "Celsius" "
        echo " Temperature:  $(echo $data | jq .main.temp) "Celsius" " >> 'output.html'
        #Humidity
        echo " Humidity:  $(echo $data | jq .main.humidity) "%" " 
        echo " Humidity:  $(echo $data | jq .main.humidity) "%" "  >> 'output.html'

        echo "$(date)"

        echo “Hello world can you see meeeee?” >>  'output.html' 

        date  >> 'output.html'
        
        cp output.html /var/www/localhost/htdocs/index.html



    httpd   
    httpd


