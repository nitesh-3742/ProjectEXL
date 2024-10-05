FROM python:3.9-slim

# Install Node.js (required for JupyterLab extensions)
RUN apt-get update && apt-get install -y nodejs npm

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install the dependencies specified in the requirements file
RUN pip install -r requirements.txt

# Copy everything from the current directory to the container
COPY . .

# Convert Jupyter notebook to a Python script
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
