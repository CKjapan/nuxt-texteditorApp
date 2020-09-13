FROM node:12.16.1
WORKDIR /usr/src/app
RUN yarn global add @vue/cli

ENV HOST 0.0.0.0
ENV PORT 3000
