# Builder
FROM node:16.17.0 as builder
WORKDIR /src

RUN npm config set registry https://registry.npmmirror.com
RUN npm install -g pnpm

COPY . /src

# App
RUN cd /src
RUN npm install
RUN echo "SESSION_SECRET=abc123" > .env
RUN npm run build

CMD npm start
