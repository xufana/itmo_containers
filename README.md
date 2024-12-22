# Лабораторная работа 1

## Запуск
Создать файл `.env`, который содержит в себе такие переменные (+пример заполнения):
```
POSTGRES_USER=airflow
POSTGRES_PASSWORD=airflow
POSTGRES_DB=airflow
AIRFLOW_ADMIN_USER=airflow
AIRFLOW_ADMIN_PASSWORD=airflow
AIRFLOW_ADMIN_EMAIL=airflow@airflow.com
```

```
 docker-compose up --build
```


## Структура

1. Postgres-db
БД. 

2. airflow-init (в compose фалйе просто init)
Создаём БД для airflow и создаём юзера-админа в БД

3. airflow-webserver (в compose фалйе просто webserver)
Веб-сервер airflow

## Впоросы

### Можно ли ограничивать ресурсы (например, память или CPU) для сервисов в docker-compose.yml? Если нет, то почему, если да, то как?

Можно, для этого на этапе "deploy" можно прописать что-то такое:

```
deploy:
  resources:
    limits:
      memory: 60m
      cpus: '0.25'
```

### Как можно запустить только определенный сервис из docker-compose.yml, не запуская остальные?

Да, так:

```
docker-compose up webserver
```

Поднимется только сервис webserver из compose файла