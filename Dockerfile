# FROM node:latest
# WORKDIR /app
# COPY package.json .
# RUN npm cache clean --force
# COPY . .
# RUN npm install
# EXPOSE 3000
# CMD ["npm", "run", "preview"]

FROM node:latest AS builder 
WORKDIR /app

# Copy package.json and dependencies
COPY package.json ./
RUN npm install

# Create a user with non-root privileges
RUN useradd -r -u 1000670000 -g 0 appuser

# Switch to the user for subsequent commands
USER appuser

# Copy remaining project files
COPY . .

# Build the application (adjust command based on your project)
RUN npm run build

# Final image stage (optional, for production)
FROM node:latest
WORKDIR /app

# Copy the built application from the builder stage
COPY --from=builder /app .

EXPOSE 3000
CMD ["npm", "run", "preview"]
