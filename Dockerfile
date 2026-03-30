# Use Node.js (lightweight)
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy full project
COPY . .

# Build step (important for React/Vite apps)
RUN npm run build || true

# Expose port (your app uses 3000)
EXPOSE 3000

# Start app
CMD ["npm", "start"]
