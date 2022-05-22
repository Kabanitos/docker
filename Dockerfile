#Базовый image
FROM alpine:latest
LABEL maintainer="a.mishanin"
RUN apk add --update --no-cache nginx 
COPY default.conf /etc/nginx/http.d
COPY  index.html /var/www/localhost/htdocs
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

