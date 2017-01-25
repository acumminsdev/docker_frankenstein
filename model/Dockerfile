FROM jupyter/datascience-notebook
MAINTAINER david.carlson@zurichna.com

ENV http_proxy http://10.148.0.180:80
ENV https_proxy http://10.148.0.180:80

#setup R
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('rpart.plot')"
RUN Rscript -e "install.packages('pROC')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('biglm')"

#setup python
RUN pip install rpy2
