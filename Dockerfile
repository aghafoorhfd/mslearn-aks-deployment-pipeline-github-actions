# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the HTML file to the default Nginx HTML location

RUN mkdir contoso-website

COPY index.html /usr/share/nginx/html/

WORKDIR /contoso-website/src


# Copy the rest of the website files to the default Nginx HTML location
COPY . /contoso-website/src
 
# Expose port 80 to the outside world
EXPOSE 80



