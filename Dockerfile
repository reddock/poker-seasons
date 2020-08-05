# build stage
FROM node:lts-alpine 
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . . 
RUN npm run build

# production stage
FROM nginx:stable-alpine
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf