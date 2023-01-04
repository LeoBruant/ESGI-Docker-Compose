compose = docker compose
exec = $(compose) exec

exec-nginx1 = $(exec) nginx1
exec-nginx1 = $(exec) nginx1
exec-web1 = $(exec) web1
exec-web2 = $(exec) web2

ssh-nginx1:
	$(exec-nginx1) sh

ssh-nginx2:
	$(exec-nginx2) sh

ssh-web1:
	$(exec-web1) sh

ssh-web2:
	$(exec-web2) sh
