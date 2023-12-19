FROM nextcloud:27.1.5-fpm-alpine

# Copy custom scripts and set execute permissions
COPY sbin/* /sbin/
RUN chmod +x /sbin/docker-entrypoint.sh

# Set the entrypoint and default command
ENTRYPOINT ["/sbin/dokku-entrypoint.sh"]
CMD ["php-fpm"]

# Copy additional configuration files
COPY nginx.conf.sigil .
COPY nginx.conf.d/nextcloud.conf ./nginx.conf.d/nextcloud.conf
