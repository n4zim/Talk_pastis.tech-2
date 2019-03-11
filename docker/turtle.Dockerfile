FROM node:6-stretch
ENV OS_NAME "Debian 9 (stretch)"

# Install
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production

# JS
COPY server.js .

# View
COPY views/turtle.html ./views/turtle.html

# Static
COPY static/common.css ./static/common.css
COPY static/turtle.png ./static/turtle.png

# Start
EXPOSE 8080
CMD [ "npm", "start", "turtle" ]
