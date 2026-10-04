FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    xvfb \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install --no-cache-dir \
    openai>=1.54.0 \
    pytest>=8.0.0 \
    flake8>=7.0.0

COPY gpt6_sol_agent.py .
COPY computer_control_loop.py .

CMD ["python3", "gpt6_sol_agent.py"]
