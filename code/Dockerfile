FROM quay.io/keboola/docker-custom-r:latest

# Copies the current directory into the image /code folder/
COPY . /code/

# Install some commonly used R packages and the R application
RUN Rscript /code/install_packages.R

# sets the data folder as the working directory 
WORKDIR /data/

# Runs the script in the /code/ folder
CMD ["Rscript", "/code/main.R"]
