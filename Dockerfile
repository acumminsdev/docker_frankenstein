FROM jupyter/datascience-notebook

#setup R
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('rpart.plot')"
RUN Rscript -e "install.packages('pROC')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('biglm')"

#setup python
RUN pip install rpy2
RUN pip install flask-restplus

COPY model.rds /home/jovyan/model.rds
COPY app.py /home/jovyan/app.py

EXPOSE 5000
CMD python /home/jovyan/app.py
