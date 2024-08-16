# Use the official Anaconda base image
FROM continuumio/anaconda3

# Set the working directory
WORKDIR /app

# Install eccodes using conda from the conda-forge channel
RUN conda install -c conda-forge eccodes

# Set the environment variable for the CDS API key file location
ENV CDSAPI_RC /app/.cdsapirc

# Copy the requirements file
COPY requirements.txt .
COPY config.sh /config.sh

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose Jupyter port and dash port
EXPOSE 8888 8050

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]