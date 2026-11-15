# JakSense — Prototipe Pusat Kendali Smart City Monitoring System (SCMS)
# Image ringan berbasis Nginx yang berjalan sebagai non-root di port 8080.
FROM nginxinc/nginx-unprivileged:1.27-alpine

LABEL org.opencontainers.image.title="JakSense Pusat Kendali" \
      org.opencontainers.image.description="Prototipe dashboard Smart City Monitoring System DKI Jakarta" \
      org.opencontainers.image.source="https://github.com/mbahjoyo741-png/jaksense-smart-city-monitoring" \
      org.opencontainers.image.licenses="MIT"

COPY --chown=nginx:nginx docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY --chown=nginx:nginx app/ /usr/share/nginx/html/

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/healthz || exit 1
