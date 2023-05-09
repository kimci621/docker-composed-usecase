FROM node:16

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

EXPOSE 5000

CMD [ "npm", "run", "serve"]

# чтобы подключиться к монго с network надо указать имя контейнера mongodb://container_name:27017/notes
# -d - тихий запуск