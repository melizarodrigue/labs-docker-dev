# Usa la imagen base oficial de Ubuntu
FROM ubuntu:latest

# Establece el mantenedor de la imagen
LABEL maintainer="melir1168@gmail.com "

# Actualiza los paquetes e instala algunas herramientas básicas
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    && apt-get clean

# Establece el directorio de trabajo
WORKDIR /app

# Copia el contenido local al directorio de trabajo en el contenedor
COPY . /app

# Define el comando por defecto para ejecutar cuando se inicie el contenedor
CMD ["bash"]

# Usa la imagen base oficial de Ubuntu
FROM ubuntu:latest

# Actualiza los paquetes e instala nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Exponer el puerto 80
EXPOSE 80

# Define el comando por defecto para ejecutar nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]

FROM ubuntu:latest
RUN apt-get update && apt-get install -y nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
