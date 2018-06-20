# Docker Cheat Sheet

## Creates the image from the selected directory and DOCKERFILE . stands for current directory

`docker build --tag <image_name> .`

## Run the image - you will not able to change neither the code or the content - this is exactly what you will get in KBC

`docker run <image_name>`

## Open the image in the console and attach the data and code folders so you can edit files in it

* -i or --interactive stands for iterative mode = you can use the console
* -v or --volume links a folder in your computer to a folder in the image: <your_folder>:<container_folder>
* -e or --entrypoint prevents from executing the image entrypoint command (Rscript main.r) and opens the command line instead


`docker run --volume=<physicalhostpathtodata>:/data/ --volume=<physicalhostpathtocode>:/code/  --entrypoint /bin/bash  -i -t <image_name>`

## run from the bash the R script
`Rscript ./main.R /data/`


## Purges all containers - this will remove all active and inactive containers from the disk: 
<<<<<<< HEAD
`docker rm ``docker ps --no-trunc -aq`` -f`

## Same thing but removes images
`docker image rm ``docker image ls --no-trunc -aq`` -f`
=======
docker rm `docker ps --no-trunc -aq` -f

## Same thing but removes images
docker image rm `docker image ls --no-trunc -aq` -f
>>>>>>> bcd417d6eb22318f5b3587356e87fafb8496767e
