# Using official python runtime base image
FROM python:2.7-slim

# Set the application directory
WORKDIR /app

RUN apt-get update \
 && apt-get install -y r-base \
 && echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile \
 && Rscript -e "install.packages('biglm')"

# Install our requirements.txt
ADD requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Copy our code from the current folder to /app inside the container
ADD . /app

# Make port 5000 available for links and/or publish
EXPOSE 5000

# Environment Variables
ENV NAME Titanic

USER 1001

# Define our command to be run when launching the container
CMD ["python", "app.py"]
