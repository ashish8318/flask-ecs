# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy application files
COPY app.py requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application's port
EXPOSE 5000

# Command to run the app using Gunicorn
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app", "-p", "5000:5000"]
