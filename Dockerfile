# Use a base image that includes Hugo and Nginx
FROM klakegg/hugo:ext-alpine AS builder

# Set the working directory
WORKDIR /contoso-website/src

# Copy the project files to the working directory
COPY . .

# Update submodules
RUN git submodule update --init themes/introduction

# Run Hugo to generate the static site
RUN hugo

# Use a lightweight Nginx image for serving the static site
FROM nginx:alpine

# Copy the generated files from the builder stage to the Nginx web root
COPY --from=builder /contoso-website/src/public /usr/share/nginx/html

# Expose port 80
EXPOSE 80
