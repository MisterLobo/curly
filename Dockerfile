FROM node:23-slim as base

EXPOSE 8080
EXPOSE 443

WORKDIR /workdir
COPY . .

# ARG SERVICE_NAME

# ENV NODE_ENV=production
# ENV NODE_PATH=.
# ENV LOGS_BUCKET_LOCATION=gs://curly_build_logs

RUN npm install

ENV PORT=8080
RUN ./node_modules/.bin/nx build api --configuration=production

FROM base AS final
WORKDIR /dist
#COPY apps/api/dist ./

COPY --from=base /workdir/apps/api/dist .
# COPY --from=builder /workdir/package-lock.json /workdir/package-lock.json

# tslib issue: https://github.com/nrwl/nx/issues/2625
RUN npm add tslib@2.3.1

CMD ["node", "main.js"]