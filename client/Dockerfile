# Use an existing docker image as a base
FROM node:alpine as builder

WORKDIR '/app/'

# Copy the files into the Container
COPY ./package.json ./

# Download and install a dependency
RUN npm install
COPY . .

# Tell the image to build
RUN npm run build

# Nginx Configuration for Run Phase for Production environment
FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html

