FROM node:9 as build

RUN mkdir /app && chmod 775 /app
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . /app/

FROM node:9-alpine

COPY --from=build /app/ /app/
WORKDIR /app

CMD ["npm", "start"]
