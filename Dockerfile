# Builder
FROM node:latest
WORKDIR /app

RUN npm config set registry https://registry.npmmirror.com
RUN npm install -g pnpm

COPY . /app

# App
RUN cd /app
RUN pnpm install
RUN echo "SESSION_SECRET=abc123" > .env
RUN pnpm build

CMD pnpm start
