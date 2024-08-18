# Use an official Nginx image as the base image
FROM nginx:alpine

# Copy the HTML files to the Nginx directory
COPY ./html /usr/share/nginx/html

# Expose port 80
EXPOSE 80
