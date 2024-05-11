# Usa una imagen base de Python
FROM python:3.9-slim

# Establece el directorio de trabajo en /app
WORKDIR /app

# Instala las dependencias necesarias para la aplicación
RUN pip install fastapi uvicorn httpx scikit-learn

# Copia tu script Python y el modelo gb al contenedor
COPY . .

# Copia el modelo gb al directorio de trabajo del contenedor
COPY modelo_gb.pkl .

# Expone el puerto 8000 para la API
EXPOSE 7070

# Comando para ejecutar la API cuando el contenedor se inicia
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
