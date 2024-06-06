# Use a base image that includes Hugo and Git
FROM klakegg/hugo:ext-alpine AS builder

# Set the working directory
WORKDIR /contoso-website/src

# Install Git (if not already included in the Hugo image)
RUN apk update && apk add --no-cache git

# Copy the project files to the working directory
COPY . .

# Print the contents of the .gitmodules file for debugging
RUN cat .gitmodules

# Update submodules with verbose output for better debugging
RUN git submodule update --init --recursive --progress

# Run Hugo to generate the static site
RUN hugo

# Use a lightweight Nginx image for serving the static site
FROM nginx:alpine

# Copy the generated files from the builder stage to the Nginx web root
COPY --from=builder /contoso-website/src/public /usr/share/nginx/html

# Expose port 80
EXPOSE 80
