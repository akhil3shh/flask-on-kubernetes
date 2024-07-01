# Python runtime as base image
FROM python:3.9-slim

# Working directory in the container
WORKDIR /app

# Install required packages and remove unwanted
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file into the container
COPY requirements.txt .

# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the app code
COPY . .

# Command to run your app
CMD ["python", "app.py"]
