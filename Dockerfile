# ---------- Build Stage ----------
FROM node:18-alpine AS build

WORKDIR /app

COPY . .

WORKDIR /app/Food

# dependencies install
RUN npm install

# build
RUN npm run build


# ---------- Production Stage ----------
FROM nginx:alpine

# build files copy
COPY --from=build /app/Food/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
