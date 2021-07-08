FROM node:14-alpine
WORKDIR /app
COPY . .
RUN npm i
EXPOSE 3000
CMD ["npm", "start"]
