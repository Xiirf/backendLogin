# Use a lighter version of Node as a parent image
FROM node:latest
# Set the working directory to /api
WORKDIR /api
# copy package.json into the container at /api
COPY package*.json /api/
# install dependencies
RUN npm install
# Copy the current directory contents into the container at /api
COPY . /api/
RUN npm rebuild bcrypt --update-binary
# Make port 80 available to the world outside this container
EXPOSE 6200
# Run the app when the container launches
CMD ["npm", "start"]
