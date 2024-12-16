# плохая практика: делает сборку нестабильной
FROM apache/airflow:latest

USER root

# плохая практика: похожие команды запускать по-отдельности и накидывать слои, увеличивая размер образа
RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install vim
RUN apt-get -y install wget
RUN apt-get clean

# плохая практика: делать всё из под юзера root
# USER airflow и всё же без этой строчки оно не сбилдилось даже bruh

# по идее это тоже плохо, потому что мы будем каждый раз копировать requirements.txt, даже если там ничего не поменялось
COPY . .
RUN pip install --upgrade pip && pip install -r requirements.txt --no-cache-dir

VOLUME ["/opt/airflow/dags", "/opt/airflow/logs"]

# плохая практика: отсутствие healthcheck, усложняет понимание, что пошло не так

RUN airflow db init

CMD ["airflow", "webserver"]