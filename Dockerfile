FROM mcr.microsoft.com/playwright:v1.55.0-noble

# Upgrade npm
RUN npm install -g npm@latest

# Install the latest Playwright
RUN npm install -g playwright@latest

# Install browser binaries for the latest Playwright
RUN npx playwright install --with-deps
