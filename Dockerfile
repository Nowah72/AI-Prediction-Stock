FROM python:3.9

# Install system-level dependencies
RUN apt-get update && \
    apt-get install -y build-essential wget curl cmake libssl-dev \
    libffi-dev python3-dev libatlas-base-dev libgfortran5 \
    libta-lib0 ta-lib

# Set the working directory
WORKDIR /app

# Copy the requirements file and application code
COPY app/requirements.txt .  
COPY app/ .

# Upgrade pip and setuptools
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# Install remaining Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Specify the entry point for your application
CMD ["python", "tradebot.py"]
