# ---------- Build Stage ----------
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy frontend folder
COPY frontend/ ./frontend

# Move into frontend
WORKDIR /app/frontend

# Install dependencies
RUN npm install

# Build the app
RUN npm run build


# ---------- Production Stage ----------
FROM nginx:alpine

# Copy built files to nginx
COPY --from=build /app/frontend/build /usr/share/nginx/html

# Expose nginx port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
