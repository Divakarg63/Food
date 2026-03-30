# Stage 1: Build React App
FROM node:18-alpine AS build

WORKDIR /app

# Copy all files
COPY . .

# Install dependencies
RUN npm install

# Build the app
RUN npm run build


# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy build files to nginx html folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
