# Лабораторная работа 3

## Задача
### 1 Установка minikube

![Установка и запуск minicube](image.png)
Установлено, проверено, запущено!

### 2 Создаем объекты через CLI

![Создание и проверка](image-1.png)
Создали и проверили

![nextcloud](image-2.png)
Создали и проверили сущности из nextcloud

![nextcloud logs](image-3.png)
Где-то с третьего раза оно поднялось
я такая тупая блин класссссс 💅💅💅


### 3 Задание

Файлы отредачены, запущены, поднято

![hw ready](image-4.png)

#### Теория

Важен ли порядок выполнения этих манифестов? Почему?
Ответ: Да, в большинстве случаев оно не запустится, если деплоить до конфига или сикрета (пробовала ли я? да, случайно)

Что (и почему) произойдет, если отскейлить количество реплик postgres-deployment в 0, затем обратно в 1, после чего попробовать снова зайти на Nextcloud?
Ответ: Если отскейлить реплики postgres-deployment до 0, БД будет недоступной. После возвращения количества реплик к 1 база данных снова будет работать, но Nextcloud сам по себе не восстановит соединение.

Бонус, потому что это лаба вытрясла из меня душу:

![meme](telegram-cloud-photo-size-2-5427125378671044568-y.jpg)