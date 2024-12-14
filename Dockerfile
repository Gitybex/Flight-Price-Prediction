# Use an official Python runtime as the base image
FROM python:3.8-slim

# Set environment variables to prevent Python from buffering outputs
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt /app/

# Install the dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the entire application to the container
COPY . /app/

# Expose the port the app runs on
EXPOSE 5000

# Set the command to run the app
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
