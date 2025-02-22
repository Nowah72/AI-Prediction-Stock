FROM python:3.9

# Install system dependencies
RUN apt-get update && \
    apt-get install -y build-essential wget curl && \
    apt-get install -y libta-lib-dev && \
    apt-get clean

# Set the working directory
WORKDIR /app

# Copy the requirements file and application code
COPY app/requirements.txt .  
COPY app/ .  

# Upgrade pip before installing packages
RUN pip install --upgrade pip

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Specify the entry point for your application
CMD ["python", "tradebot.py"]
