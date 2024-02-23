FROM node:latest
WORKDIR /app
COPY package.json .
RUN npm cache clean --force
COPY . .
RUN npm install
EXPOSE 3000
CMD ["npm", "run", "preview"]

