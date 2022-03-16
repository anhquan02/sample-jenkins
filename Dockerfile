FROM node:12

RUN apt-get update && apt-get install -y libaio1 wget unzip

WORKDIR /app

COPY ["package.json", "yarn.lock", "./"]
RUN yarn

EXPOSE 3001

COPY . .
ENV LIB_DIR=1

RUN npm run build

CMD [ "npm", "run", "start" ]