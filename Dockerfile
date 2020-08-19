FROM node:12 

#Create directory to store the app
WORKDIR /usr/src/app

# Install app dependencies: wildcard (*) is used so that both package.json 
#and the package-lock.json are copied over
# The copied packages are then installed using npm install

COPY package*.json ./
RUN npm install

# To bundle the app's source code inside the Docker image,
#copy everything in the root
COPY . .

# As per the server.js file, the app binds to port 8080, so we need to EXPOSE
#that port

EXPOSE 8080

# To get the app to run, we need to run the "node server,js" command

CMD ["node", "servers.js"]