build: 
	docker-compose build

start:
	docker-compose up -d

down:
	docker-compose down

clean: 
	docker system prune -f --volumes