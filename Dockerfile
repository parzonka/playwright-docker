FROM node:20-bookworm

# Install system dependencies required by Chromium/Edge
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libdrm2 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libxkbcommon0 \
    libasound2 \
    libcups2 \
    libnss3 \
    libxshmfence1 \
    libx11-6 \
    libxext6 \
    libxfixes3 \
    libxrender1 \
    libxi6 \
    libxcursor1 \
    libpango-1.0-0 \
    libcairo2 \
    fonts-liberation \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workdir

# Set NODE_PATH for global module resolution
ENV NODE_PATH=/usr/local/lib/node_modules

# Install the latest Playwright with typescript
RUN npm install -g playwright @playwright/test typescript ts-node @types/node dotenv cross-env orval

# Install only Microsoft Edge browser binaries
RUN npx playwright install msedge
