# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /apps

# Copy the current directory contents into the container at /app
COPY . /apps

# Install any needed packages specified in requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV FLASK_APP=apps.py

# Run the application
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:80", "apps:apps"]

