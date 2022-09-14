# ActivityAPI
 Activty using API in bash script

 First exercise using Docker. Containerizing a python simple app that outputs helloworld html file using Apache webserver for beginners:
 
1. With git pre installed in your computer, clone this reposotiry using

           git clone <URL> 
 
In a directory of your choice.
 
2. Now that the files are copied in your directory, open your favorite IDE, open the files and run the next commands in the terminal (if you prefer running the commands in your CLI it's okay too, just make sure you are in the right directory)
 
 3. Firs we have to build our image:
 
            docker build . -t <<name>> 
 
 (In _name_ you will write how you want to name your image, without the << >>)
 
 4. Then when everything is built, we will run our container with the next command:
 
            docker run -dit --name <<name_container>> -p 8080:80 <<name_app>>
            
    Where you name your container in <<name_container>> 
    and select your desired ports, in this case, we expose container port 80 of a running container to any PORT on users laptop machine (in this case the 8080, but you can choose the one you think it's better)
            
 5. To check if your container is running, write the next command:

            docker ps
           
    It will appear a little table with your container ID, image, command, status, ports you are using and names of your active containers
 
 6. Now everything is set! Go check your Hello World output in the next URL to see that your app is running!

             http://localhost:[PORT]/ 
             
   In our examenple with the used ports, the URL will be:
   
              http://localhost:8080/
              
 
