# ---------- Build Stage ----------
FROM node:18-alpine AS build

WORKDIR /app

# Copy all files
COPY . .

# Install dependencies
RUN npm install

# Build app
RUN npm run build


# ---------- Production Stage ----------
FROM nginx:alpine

# Copy build output (React)
COPY --from=build /app/build /usr/share/nginx/html

# Expose nginx port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
