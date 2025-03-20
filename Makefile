up:
	docker compose up -d

down:
	docker compose down

update:
	docker run -it -v ./:/app diovanegabriel/node:latest /bin/sh -c "npm i"

install:
	docker run -it -v ./app:/app diovanegabriel/node:latest /bin/sh -c "npx create-strapi-app@latest . && npm i" && \
	sudo chmod -R 777 . && \
	mv ./app/* . && \
	mv ./app/.env . && \
	mv ./app/.env.example . && \
	mv ./app/.gitignore . && \
	rm -rf ./app && \
	docker container prune -f && \
	docker compose up -d