docker run -d \
--name some-postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=123 \
-v /Users/andrei/Downloads/lab1/container:/var/lib/postgresql/data \
-p 5432:5432 \
--network mynet \
postgres:latest

docker run -d \
--name mynginx \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=123 \
-v /Users/andrei/Downloads/lab1/TestServer/nginx/nginx.conf:/etc/nginx/nginx.conf \
-v /Users/andrei/Downloads/lab1/TestServer/TestClient/dist:/etc/dist \
-p 80:80 \
-p 443:443 \
--network mynet \
nginx

docker build -t server .


docker run -d \
--name server \
-p 8080:8080  \
--network mynet \
server