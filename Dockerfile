FROM node:latest as production

ARG SERVICE_NAME

ENV NODE_ENV=production
ENV NODE_PATH=.

# install dependencies for root package.json
RUN npm install
RUN npm install -g nx
RUN nx build ${SERVICE_NAME} --configuration=production

COPY package.json package-lock.json ./

FROM production AS builder
WORKDIR /workdir

#COPY --from=builder /workdir/dist/apps/${SERVICE_NAME} /workdir/
#COPY --from=builder /workdir/package-lock.json /workdir/package-lock.json

# Install production dependencies only
#RUN npm install
# tslib issue: https://github.com/nrwl/nx/issues/2625
#RUN npm add tslib@2.3.1

CMD ["node", "dist/main.js"]