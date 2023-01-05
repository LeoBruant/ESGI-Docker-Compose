compose = docker compose
exec = $(compose) exec

exec-nginx1 = $(exec) nginx1
exec-nginx2 = $(exec) nginx2
exec-web1 = $(exec) web1
exec-web2 = $(exec) web2

build:
	$(exec-web1) npm run build
	$(exec-web2) npm run build

migrate:
	$(exec-web1) php artisan migrate:fresh
	$(exec-web2) php artisan migrate:fresh

ssh-nginx1:
	$(exec-nginx1) sh

ssh-nginx2:
	$(exec-nginx2) sh

ssh-web1:
	$(exec-web1) sh

ssh-web2:
	$(exec-web2) sh

start:
	$(compose) stop
	$(compose) up --build -d
	make build
	make migrate

up:
	$(compose) up -d
	make build
	make migrate
