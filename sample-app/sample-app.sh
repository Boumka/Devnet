#!:bin/bash



mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.


echo  "FROM python" >> tempdir/Dockerfile

echo "RUN pip install flask" >> tempdir/Dockerfile

#copy to add folders to  conatiner directory
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile

#To expose port 8080 for user webserver
echo "EXPOSE 8080" >> tempdir/Dockerfile
#add CMS command to execute the python script
echo "CMD python3 /home/myapp/sample_app.py" >> tempdir/Dockerfile

#Build the conainter  ==> add commands to switch to tempdir directory for build 
#he docker build command -t option allows you to specify the name of the container and the 
#trailing period (.) indicates that you want the container built in the current directory.

cd tempdir 
docker build -t sampleapp .

#docker run
# -t specifies that you want  a terminal created for the conainter so the you can access it at the CLI
#d indicates that you want the container to run in the background and print the container ID when 
# executing the docker ps -a command.
#The first 8080" 
#references the port for the app running in the docker container (our sampleapp). the second "8080
#tells docker to use this port on the host. These values do not have to be the same

docker run -t -d -p 8080:8080 --name samplerunning sampleapp


#docker ps -a command to display all currently running Docker containers.

docker ps -a

