FROM nginx:latest

# Copy the build artifacts into the Nginx serve directory
COPY ./build/web /usr/share/nginx/html

# Ensure permissions are set correctly
RUN chmod -R 755 /usr/share/nginx/html && chown -R nginx:nginx /usr/share/nginx/html

# Copy the Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf