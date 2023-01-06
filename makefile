compose = docker compose
exec = $(compose) exec

dev:
	$(exec) web1 npm run dev
	$(exec) web2 npm run dev

generate:
	$(exec) web1 php artisan key:generate
	$(exec) web2 php artisan key:generate

migrate:
	$(exec) web1 php artisan migrate:fresh --seed
	$(exec) web2 php artisan migrate:fresh --seed

ssh-nginx1:
	$(exec) nginx1 sh

ssh-nginx2:
	$(exec) nginx2 sh

ssh-web1:
	$(exec) web1 sh

ssh-web2:
	$(exec) web2 sh

start:
	$(compose) stop
	$(compose) up --build -d
	make generate
	make migrate

up:
	$(compose) stop
	$(compose) up -d
