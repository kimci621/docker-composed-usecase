mongo:
		docker run -p 27017:27017 \
				-d \
				--rm \
				--name mongo \
				--network mern-network \
				--env-file ./config/development.env \
				-v mongo-data:/data/db \
				mongo

server-run:
		docker run -p 5000:5000 \
				-d \
				--rm \
				--name MERN-SERVER \
				--network mern-network \
				--env-file ./config/development.env \
				-v C:/Users/Amir/Desktop/docker-test/mern/docker-mern/server:/app \
				-v /app/node_modules \
				mern-server-image

client-run:
		docker run -p 3000:3000 \
				-d \
				--rm \
				--name MERN-CLIENT \
				--network mern-network \
				-v C:/Users/Amir/Desktop/docker-test/mern/docker-mern/client/src:/app/src \
				-v /app/node_modules \
				mern-client-image

server-build:
		docker build -t mern-server-image ./server

client-build:
		docker build -t mern-client-image ./client

server-kill: 
		docker stop MERN-SERVER

client-kill: 
		docker stop MERN-CLIENT

server-remove: 
		docker rmi mern-server-image

client-remove: 
		docker rmi mern-client-image
		
kill-all:
		docker kill $(docker ps -q) && docker rm $(docker ps -a -q) && docker rmi $(docker images -q)

docker-compose-dev:
		docker-compose -f docker-compose.yml up -d

docker-compose-kill:
		docker-compose down

prod:
		docker-compose -f docker-compose.production.yml up

remove-prod: 
		docker-compose down && docker image prune -a