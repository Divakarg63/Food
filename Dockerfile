# Use lightweight Node image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files
COPY . .

# Build step (if React or frontend build exists)
RUN npm run build || true

# Expose port (your Jenkins uses 3000)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
