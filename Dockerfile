FROM node:9 as build

WORKDIR /app
COPY package.json ./
RUN npm install

COPY . .

FROM node:9-alpine

COPY --from=build /app /
EXPOSE 3000
CMD ["node", "./bin/start"]
