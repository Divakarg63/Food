# Use lightweight Node image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy only package files first (better caching)
COPY package*.json ./

# Install dependencies (clean + faster)
RUN npm install --omit=dev

# Copy rest of the code
COPY . .

# Expose port (your app uses 3000)
EXPOSE 3000

# Start app
CMD ["npm", "start"]
