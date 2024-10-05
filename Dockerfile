# Use an official Python runtime as a parent image
FROM python:3.12

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for Flask
EXPOSE 8080

# Define environment variable
ENV FLASK_APP=apps.py

# Run the application
CMD ["gunicorn", "-b", "0.0.0.0:8080", "apps:apps"]


