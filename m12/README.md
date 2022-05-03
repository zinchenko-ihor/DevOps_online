<h2 align="center"> 
  <img alt="Jenkins" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Jenkins_logo_with_title.svg/2560px-Jenkins_logo_with_title.svg.png" width="400"> 
</h2>
<h2 align="center"> Jenkins basic </h2>

***Result of task 12*** <br>
Jenkins was installed in the Docker container and the necessary plugins were installed to work with Docker. 
A Freestyle project is executed, which, as a result, displays the current time on the screen.
A Pipeline has been created, which runs the docker ps -a command on the Jenkins Agent running on the Master's Jenkins host. 
Also create a Pipeline that downloads the code from my git repository and builds a docker image from my Dockerfile. 
When the Pipeline was created, it passed the variable PASSWORD = QWERTY! encrypted into a docker container. Ansible script has been written that deploys jenkins. 
Screenshots are attached in the IMG folder.
