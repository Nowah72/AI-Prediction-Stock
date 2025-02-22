FROM python:3.9

# Install system-level dependencies
RUN apt-get update && \
    apt-get install -y build-essential wget libssl-dev

# Download and install ta-lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
    tar -xzf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    cd .. && \
    rm -rf ta-lib ta-lib-0.4.0-src.tar.gz

# Set the working directory
WORKDIR /app

# Copy the requirements file and application code
COPY app/requirements.txt .
COPY app/ .

# Install Python dependencies
RUN pip install -r requirements.txt

# Specify the entry point for your application
CMD ["python", "tradebot.py"]
