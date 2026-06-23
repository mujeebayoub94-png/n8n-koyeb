FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache curl

USER node

ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV NODE_ENV=production

EXPOSE 5678

CMD ["n8n", "start"]
