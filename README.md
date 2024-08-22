# steps
STATEMENT - 1
1 - Create EC2 t2.micro instance 
2 - login through SSH
3 - sudo apt update
4- Create Dockerfile (for image to run container)
5- vi Dockerfile 
6 - Build the image from Dockerfile 
7 - docker build -t wiscow . (wiscow is image name given by me)
8 - run container by that image
9- docker run -it --name wisecow1 wiscow -p 4499 /bin/bash
10- Allow port no. 4499 in security group in AWS
11- ping ip of EC2 instance get wisecow app
