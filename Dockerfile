FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# this signifies the end of the builder "phase"
FROM nginx

# Expose port 80 for elastic beanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html