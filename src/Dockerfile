FROM ubuntu:24.04

RUN apt update && apt install -y lua5.4

WORKDIR /app
COPY . .

CMD ["lua", "main.lua"]