FROM node:14-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --production

COPY . .


FROM node:14-alpine
WORKDIR /app
COPY --from=build /app /app
EXPOSE 3000
RUN addgroup -S newgroup && adduser -S usertest -G newgroup
USER usertest

CMD ["npm", "start"]
