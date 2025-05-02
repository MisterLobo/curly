FROM node:22-bullseye-slim as production

WORKDIR /workdir

ARG SERVICE_NAME

# install dependencies for root package.json
COPY package.json package-lock.json ./
RUN npm install
RUN npm install -g nx

# Builder to compile Typescript
FROM production as builder

ENV NODE_ENV=production
ENV NODE_PATH=.

COPY ./ .
RUN nx build ${SERVICE_NAME} --configuration=production

WORKDIR /workdir

ARG SERVICE_NAME

ENV NODE_ENV=production
ENV NODE_PATH=.

COPY --from=builder /workdir/dist/apps/${SERVICE_NAME} /workdir/
COPY --from=builder /workdir/package-lock.json /workdir/package-lock.json

# Install production dependencies only
RUN npm install
# tslib issue: https://github.com/nrwl/nx/issues/2625
RUN npm add tslib@2.3.1

CMD ["node", "apps/dist/main.js"]