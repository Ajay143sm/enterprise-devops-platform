# Use an ultra-lightweight, production-ready Nginx image based on Alpine Linux
FROM nginx:alpine

# Copy our custom sample application web code from the local app/ directory 
# directly into the default Nginx HTML serve path inside the container
COPY ./app/index.html /usr/share/nginx/html/

# Expose port 80 inside the container container network 
# (Ansible will route traffic to this port later)
EXPOSE 80

# Start Nginx in the foreground so the Docker container stays active and runs stably
CMD ["nginx", "-g", "daemon off;"]
