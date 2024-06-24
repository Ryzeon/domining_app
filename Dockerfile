FROM nginx:latest

# Set the working directory
WORKDIR /app

# Copy the code into the container
COPY /build/web /app

# Copy the build artifacts into the Nginx serve directory
COPY ./build/web /usr/share/nginx/html

# Copy the Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf