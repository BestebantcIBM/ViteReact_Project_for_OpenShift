FROM node:latest
WORKDIR /usr/src/app

# Copiar el archivo package.json e instalar las dependencias
COPY package.json .
RUN npm install

# Copiar el resto de la aplicación
COPY . ./

# Establecer los permisos adecuados para los archivos
RUN chown -R node:node /usr/src/app

# Cambiar los permisos del directorio .npm
RUN mkdir /.npm && chown -R node:node /.npm

# Cambiar al usuario no privilegiado para evitar ejecutar la aplicación como root
USER node

# Exponer el puerto y definir el comando de inicio
EXPOSE 3000
CMD ["npm", "run", "build"]

