# 手順

## Start

bash

```bash
touch Dockerfile docker-compose.yml
```

Dockerfile

```yaml
FROM node:12.16.1
WORKDIR /usr/src/app
RUN yarn global add @vue/cli

ENV HOST 0.0.0.0
ENV PORT 3000
```

```yaml
version: "3"
services:
  app:
    build: .
    container_name: quill
    ports:
      - "3000:3000"
    volumes:
      - .:/usr/src/app
    working_dir: /usr/src/app
    stdin_open: true
    tty: true
```

bash

```bash
docker-compose build
docker-compose up -d
docker-compose exec app /bin/bash
yarn add vue2-editor
yarn create nuxt-app frontend
cd frontend
yarn dev
```

plugins/plugin.js

```javascript
import Vue from "vue";
import Vue2Editor from "vue2-editor";

Vue.use(Vue2Editor);
```

nuxt.config.js

```javascript
  plugins: [
    {
      src: "@/plugins/plugin",
      mode: "client",
    },
  ],
```

pages/index.js

```javascript
<template>
  <div class="container">
    <div>
      <vue-editor v-model="content" />
    </div>
  </div>
</template>

<script>
import { VueEditor } from "vue2-editor";

export default {
  components: { VueEditor },

  data: () => ({
    content: "<h1>Some initial content</h1>"
  })
};
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}
</style>
```

## Link

[vue2editor](https://www.vue2editor.com/)
