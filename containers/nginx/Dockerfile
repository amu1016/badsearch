FROM nginx:1.20.0

RUN rm -f /etc/nginx/conf.d/*

ADD nginx.conf /etc/nginx/conf.d/badsearch.conf

RUN touch /var/run/nginx.pid && \
  chown -R nginx:nginx /var/run/nginx.pid && \
  chown -R nginx:nginx /var/cache/nginx

USER nginx

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

# CMD ["nginx"]