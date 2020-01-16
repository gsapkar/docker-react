FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD npm run build

FROM nginx
# the files from the builder from /app/build are copied in  a directory in nginx
COPY --from=builder /app/build /usr/share/nginx/html 
# ngnix starts automaticaly, no need to write CMD