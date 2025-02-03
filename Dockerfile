This Dockerfile defines how I packaged the application into a Docker image:
# Use the base Ubuntu image
FROM ubuntu:22.04

# Install Nginx and other necessary packages
RUN apt-get update && \
    apt-get install -y nginx curl zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download your app or website files (e.g., the 2048 game)
RUN curl -o /var/www/html/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master && \
    cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && \
    rm -rf 2048-master master.zip

# Expose port 80 to allow HTTP traffic
EXPOSE 80

# Start Nginx when the container starts (Nginx will automatically run in the foreground)
CMD ["nginx", "-g", "daemon off;"]
