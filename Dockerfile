FROM node:latest

# Establecer el directorio de trabajo
WORKDIR /usr/src/app

# Copiar el archivo package.json e instalar las dependencias
COPY package.json .

# Instalar las dependencias
RUN npm install

# Copiar el resto de la aplicación
COPY . .

# Establecer los permisos adecuados para los archivos
RUN chown -R node:node /usr/src/app

# Cambiar al usuario no privilegiado para evitar ejecutar la aplicación como root
USER node

# Exponer el puerto
EXPOSE 3000

# Comando de inicio
CMD ["npm", "run", "build"]
