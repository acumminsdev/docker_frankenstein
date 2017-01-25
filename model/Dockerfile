FROM jupyter/datascience-notebook

#setup R
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('rpart.plot')"
RUN Rscript -e "install.packages('pROC')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('biglm')"

#setup python
RUN pip install rpy2
