# Use an official Python 3.11 image
FROM python:3.10

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install dependencies
RUN pip install --upgrade pip

# Install required Python packages
RUN pip install \
    yfinance \
    scikit-learn \
    tensorflow \
    streamlit \
    matplotlib \
    numpy \
    pandas \
    jupyter

# Expose Jupyter and Streamlit ports
EXPOSE 8888 8501

# Default command: start Jupyter
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
