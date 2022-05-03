<h2 align="center"> 
  <img alt="Docker" src="https://d1.awsstatic.com/acs/characters/Logos/Docker-Logo_Horizontel_279x131.b8a5c41e56b77706656d61080f6a0217a3ba356d.png" width="400"> 
</h2>
<h2 align="center"> Docker basic </h2>

***Result of task 10*** <br>
Install docker. Write bash script for installing Docker.Downloaded and run docker container "hello world". 
Used image with html page, edit html page and paste text: Zinchenko Ihor Sandbox 2021. Create Dockerfile for building a docker image. 
Docker image run web application apache2. Web application located inside the docker image. For creating docker image use clear basic images ubuntu 18.04. 
Add an environment variable "DEVOPS= Zinchenko Ihor to my docker image docker_web. Was pushed my docker image to docker hub (https://hub.docker.com/). 
Integrated my docker image from DockerHub with my github repository (docker_hub.yaml). Created an automatic delivery to AWS S3 for each push (CI_CD.yaml). 
Create an automatic deployment on ElasticBeanstalk for each push. (Have errors with followings arguments). Created docker-compose file. 
Deployed a few docker containers via one docker-compose file. First image - my docker image docker_main. 
5 nodes of the first image was runed; second image - java application HelloWorld.java; last image - database image mariadb and adminer for administration db.
Second container should be run right after a successful run of a database container. Use env files to configure each service. Screenshots are attached in the IMG folder.
