# Use official Nginx image
FROM nginx:alpine

# Remove default config and HTML files
RUN rm -rf /etc/nginx/conf.d/* /usr/share/nginx/html/*

# Copy custom Nginx config
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy ALL static website files (HTML, JS, CSS, images, etc.)
COPY . /usr/share/nginx/html/

# Expose port 8000 (as defined in default.conf)
EXPOSE 8000

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
