# Docker
## Домашнее задание
1. Создайте свой кастомный образ nginx на базе alpine. После запуска nginx должен отдавать кастомную страницу (достаточно изменить дефолтную страницу nginx)
2. Определите разницу между контейнером и образом
3. Вывод опишите в домашнем задании.
4. Ответьте на вопрос: Можно ли в контейнере собрать ядро?
5. Собранный образ необходимо запушить в docker hub и дать ссылку на ваш
репозиторий.

## Теория
1. Определите разницу между контейнером и образом. Вывод опишите в домашнем задании.
  * Основная разница между образом и контейнером - это в доступность для записи в верхнем слое.

2. Ответьте на вопрос: Можно ли в контейнере собрать ядро?
  * Собрать ядро можно, но загрузится с него нельзя
  
## Практическая часть
1. Создаем свой кастомный образ на базе alpine
* Собираем наш образ `docker build -t www:alpine .`
* Запускаем наш контейнер командой  `docker run -d --name www -it -p 80:80 www:alpine`
* Посмотри на наш образ и контейнер
```
docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
www          alpine    863da5c585cd   2 hours ago   7.02MB
alpine       latest    0ac33e5f5afa   6 weeks ago   5.57MB
```

```
docker ps
CONTAINER ID   IMAGE        COMMAND                  CREATED         STATUS         PORTS                                   NAMES
1d7b56c1d39d   www:alpine   "nginx -g 'daemon of…"   6 seconds ago   Up 5 seconds   0.0.0.0:8080->80/tcp, :::8080->80/tcp   www
```
2. Собранный образ необходимо запушить в docker hub и дать ссылку на ваш репозиторий
* Ссылка на репозиторий - https://hub.docker.com/r/cabanitos/www/tags
* Выполняем команду `docker login`, вводим логин и пароль от учетной записи `https://hub.docker.com/`
```
docker login 
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: cabanitos
Password: 
WARNING! Your password will be stored unencrypted in /home/alex/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store
```
3. Устанавливаем тег Docker в соответствии с именем репозитория Docker Hub `docker tag www:alpine  cabanitos/www:alpine`
```
docker tag www:alpine  cabanitos/www:alpine
docker images 
REPOSITORY      TAG       IMAGE ID       CREATED       SIZE
www             alpine    863da5c585cd   3 hours ago   7.02MB
cabanitos/www   alpine    863da5c585cd   3 hours ago   7.02MB
alpine          latest    0ac33e5f5afa   6 weeks ago   5.57MB
```
4. Далее пушим наш image в Docker Hub `docker push cabanitos/www:alpine`
```
docker push cabanitos/www:alpine
The push refers to repository [docker.io/cabanitos/www]
ec2d811c10fe: Pushed 
937c8dc26ad5: Pushed 
46ea847c3e2c: Pushed 
4fc242d58285: Pushed 
alpine: digest: sha256:465e1c82ab2333eef172a4256a93e04626eed707964a38fc7a3ea78af9885df2 size: 1153
```

