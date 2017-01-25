FROM docker_frankenstein/model

RUN pip install flask-restplus

COPY model_env.rds /home/jovyan/model_env.rds
COPY flask_scoring_api.py /home/jovyan/flask_scoring_api.py

EXPOSE 5000
CMD python /home/jovyan/flask_scoring_api.py
