# ---------- Build Stage ----------
FROM node:18-alpine AS build

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy project files
COPY . .

# Build the app
RUN npm run build


# ---------- Production Stage ----------
FROM nginx:alpine

# Copy build output (change to dist if needed)
COPY --from=build /app/build /usr/share/nginx/html

# Nginx runs on port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
