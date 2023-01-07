compose = docker compose
exec = $(compose) exec

dev:
	$(exec) app1 npm run dev
	$(exec) app2 npm run dev

generate:
	$(exec) app1 php artisan key:generate
	$(exec) app2 php artisan key:generate

migrate:
	$(exec) app1 php artisan migrate:fresh --seed
	$(exec) app2 php artisan migrate:fresh --seed

ssh-nginx1:
	$(exec) nginx1 bash

ssh-nginx2:
	$(exec) nginx2 bash

ssh-app1:
	$(exec) app1 bash

ssh-app2:
	$(exec) app2 bash

start:
	$(compose) stop
	$(compose) up --build -d
	make generate
	make migrate

up:
	$(compose) stop
	$(compose) up -d
