FROM python:3.9-slim

# Step 2: Install necessary build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    gcc

# Step 3: Set environment variables
ENV PYTHONUNBUFFERED=1

# Step 4: Set the working directory inside the container
WORKDIR /app

# Step 5: Copy the requirements file to the container
COPY requirements.txt /app/

# Step 6: Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 7: Copy the rest of the application code to the container
COPY . /app/

# Step 8: Expose the port that Django will run on
EXPOSE 9000

# Step 9: Run Django's development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:9000"]
