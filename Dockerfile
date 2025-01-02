# Builder
FROM node:16.17.0 as builder
WORKDIR /src

RUN npm config set registry https://registry.npmmirror.com
RUN npm install -g pnpm

COPY . /src

# App
RUN cd /src
RUN pnpm install
RUN echo "SESSION_SECRET=abc123" > .env
RUN pnpm build

CMD pnpm start

# git@github.com:palyon-cc/jsonhero.git