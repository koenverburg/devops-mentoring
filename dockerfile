FROM node:18.2.0-slim AS base
COPY . .
WORKDIR /app
RUN npm install

FROM base AS builder
COPY --from=base package.json ./package.json
RUN npm run build

FROM node:18.2.0-slim AS runner
COPY --from=base app/package.json ./package.json
COPY --from=base app/node_modules ./node_modules
COPY --from=builder app/.next .next

CMD ["npm", "start"]
