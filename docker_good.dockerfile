FROM apache/airflow:slim-2.10.4rc1-python3.9

USER root

RUN apt-get update && \
    apt-get -y install git \
    vim \
    wget && \
    apt-get clean

USER airflow

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt --no-cache-dir

VOLUME ["/opt/airflow/dags", "/opt/airflow/logs"]

HEALTHCHECK CMD curl --fail http://localhost:8080/health || exit 1

RUN airflow db init

CMD ["airflow", "webserver"]