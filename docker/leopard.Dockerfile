FROM node:8-jessie
ENV OS_NAME "Debian 8 (jessie)"

# Install
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production

# JS
COPY server.js .

# View
COPY views/leopard.html ./views/leopard.html

# Static
COPY static/common.css ./static/common.css
COPY static/leopard.png ./static/leopard.png

# Start
EXPOSE 8080
CMD [ "npm", "start", "leopard" ]
