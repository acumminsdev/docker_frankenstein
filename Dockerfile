# Using official python runtime base image
FROM python:2.7-slim

# Set the application directory
WORKDIR /app

RUN apt-get update
RUN apt-get install -y r-base

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('rpart.plot')"
RUN Rscript -e "install.packages('pROC')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('biglm')"

# Install our requirements.txt
RUN pip install rpy2
RUN pip install flask-restplus

# Copy our code from the current folder to /app inside the container
ADD . /app

# Make port 5000 available for links and/or publish
EXPOSE 5000

# Environment Variables
ENV NAME Titanic

# Define our command to be run when launching the container
CMD ["python", "app.py"]
