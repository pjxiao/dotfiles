systemd-detect-virt && { \
    sudo sed -i 's/^bind\s\+.*/bind 0.0.0.0/' /etc/redis/redis.conf && \
    sudo systemctl restart redis
}
