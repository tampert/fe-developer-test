
FROM node:18-alpine

ENV WORKDIR /app

WORKDIR ${WORKDIR}

COPY ./todo-vue3/ ${WORKDIR}

RUN rm -rf ${WORKDIR}/node_modules && \
    npm i -g npm && \
    rm package-lock.json && \
    npm install 

ENV HOST 0.0.0.0
EXPOSE 8080

CMD ["npm", "run", "dev"]
