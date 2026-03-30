# ---------- Build Stage ----------
FROM node:18-alpine AS build

# 👇 CHANGE THIS (important)
WORKDIR /app

# Copy entire repo first
COPY . .

# 👇 Move into correct folder (adjust if needed)
WORKDIR /app/frontend

# Install dependencies
RUN npm install

# Build app
RUN npm run build


# ---------- Production Stage ----------
FROM nginx:alpine

# 👇 If React (build folder)
COPY --from=build /app/frontend/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
