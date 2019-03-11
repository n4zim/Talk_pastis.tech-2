FROM node:alpine
ENV OS_NAME "Alpine"

# Install
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production

# JS
COPY server.js .

# View
COPY views/elephant.html ./views/elephant.html

# Static
COPY static/common.css ./static/common.css
COPY static/elephant.png ./static/elephant.png

# Start
EXPOSE 8080
CMD [ "npm", "start", "elephant" ]
