# For develoment purposes - comment when you are done ---------------------

# IMPORTANT!!! Both these commands will be executed by the Dockerfile

# This sets the working directory to data, so from now on you can use relative paths. 

# setwd("data")

# Install the required packages - this will be executed during the image creation

# source("../code/install_packages.R")

# General tests  ----------------------------------------------------------

## I am alive 
print("Hello world from R");

## Load a sample library from the packagest installed by install_packages.R
library('keboola.r.docker.application')

## In all KBC documentation they will use an absolute path. Using a relative here because guess what: 
## I may be developing in windows and I need to have my config paramereters and I do not want 
## To change this whenever I do changes to the script.

path<-'.'

app <- DockerApplication$new(path)
if(app$readConfig()) print(paste0("Config loaded successfully using this path: ", path))

## Retrieving a test parametr from the configuration in the data folder
## The attributes are stored in a json under the params section. 
test_parameter<-app$getParameters()$multiplier

##prints to the console 
print("Test of loaded config in ../data/config.json")
paste0("2 x ", test_parameter, " = ", 2*test_parameter)

## writes the data to the out folder
print("Test write data to in/tables/source.csv to see if the folder is there")

data<-data.frame(letters=c("a","b"),numbers=c(1,2))

write.csv(data,"out/tables/out.csv")

## I am setting here some sample parameters to the file to be handled by Keboola
## This is done by creating a manifest file: https://developers.keboola.com/extend/common-interface/manifest-files/
if(
app$writeTableManifest("out/tables/out.csv", 
                       primaryKey = c("letters","numbers"),
                       incremental = FALSE)
)print("I created a manifest file for out/tables/out.csv")  

##prints data
out_data<-read.csv("out/tables/out.csv")
out_data

