# -----------------------
# Stage 1: Build Frontend
# -----------------------
FROM node:20-alpine AS frontend-builder
WORKDIR /app
# Copy frontend package files
COPY app/threat-composer/package.json app/threat-composer/yarn.lock ./
RUN yarn install --frozen-lockfile
# Copy frontend source
COPY app/threat-composer/. ./
RUN yarn build

# -----------------------
# Stage 2: Build Backend
# -----------------------
FROM node:22-alpine AS backend-builder
WORKDIR /app
# Copy backend package files and install
COPY app/backend/package*.json ./
RUN npm install --production
# Copy backend source
COPY app/backend/. ./
# Copy frontend build into backend for serving
COPY --from=frontend-builder /app/build /app/public

# -----------------------
# Stage 3: Runtime
# -----------------------
FROM node:22-alpine
WORKDIR /app
# Copy built backend + frontend
COPY --from=backend-builder /app /app
EXPOSE 80
CMD ["node", "lib/index.js"]
