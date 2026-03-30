# Use official Node.js image
FROM node:18

# Create app directory
WORKDIR /app

# Copy package files first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the app
COPY . .

# Expose app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
