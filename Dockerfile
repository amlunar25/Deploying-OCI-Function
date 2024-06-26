# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Add requirements.txt and install Python dependencies
ADD requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Python script into the container at /app
COPY hello.py /app

# Run the Python script when the container launches
CMD ["python", "hello.py"]