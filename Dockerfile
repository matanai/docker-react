# Prepare node, install dependencies, build app
FROM node:14-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Copy app from previous phase to nginx 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


