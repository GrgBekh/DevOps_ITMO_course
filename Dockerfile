FROM apache/airflow:2.7.1


ENV AIRFLOW_HOME=/app/airflow
WORKDIR $AIRFLOW_HOME
USER root

RUN apt-get update -y\
    && apt-get install -y python3 python3-dev gcc gfortran musl-dev

USER airflow


RUN pip install numpy

COPY ./dags ./dags

CMD ["python", "./dags/Lab1_dag.py"] 

EXPOSE 8080
