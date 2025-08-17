# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Install uv, the package installer and runner
RUN pip install uv

# Copy dependency definition files
COPY pyproject.toml uv.lock ./

# Install dependencies from the lock file for consistency
RUN uv pip sync

# Copy the rest of the application's source code
COPY . .

# Expose the port the app runs on, as seen in mcp-server.py
EXPOSE 21000

# Define the command to run the application
CMD ["uv", "run", "mcp-server.py"]
