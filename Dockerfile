FROM python:3.9

# Install system-level dependencies
RUN apt-get update && \
    apt-get install -y build-essential wget

# Set the working directory
WORKDIR /app

# Copy the requirements file and application code
COPY app/requirements.txt .
COPY app/ .

# Install TA-Lib using a pre-built wheel
RUN pip install --no-cache-dir TA-Lib==0.4.24 --no-index --find-links https://pypi.anaconda.org/ranaroussi/simple/

# Install remaining Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Specify the entry point for your application
CMD ["python", "tradebot.py"]
