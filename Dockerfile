# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the HTML file to the default Nginx HTML location

COPY index.html /usr/share/nginx/html/

WORKDIR /contoso-website/src

# Copy the rest of the website files to the default Nginx HTML location
COPY . /usr/share/nginx/html/
 
# Expose port 80 to the outside world
EXPOSE 80
