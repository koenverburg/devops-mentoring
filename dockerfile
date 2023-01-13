FROM node:18.2.0-slim AS base
COPY . .
RUN npm install

FROM base AS builder
COPY --from=base package.json ./package.json
RUN npm run build

FROM node:18.2.0-slim AS runner
COPY --from=base package.json ./package.json
COPY --from=base node_modules ./node_modules
COPY --from=builder .next .next

CMD ["npm", "start"]
