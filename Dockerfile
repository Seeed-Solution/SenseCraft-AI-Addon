FROM seeedcloud/python-sscma

RUN wget https://github.com/Seeed-Studio/SenseCraft-Web-Toolkit/releases/download/1.0.0/dist.zip \
    && unzip dist.zip -d /usr/share/nginx/html/

RUN chmod -R 777 /usr/share/nginx/html
COPY nginx/nginx-default.conf /etc/nginx/http.d/default.conf
COPY nginx/certificate.crt /etc/nginx/ssl/certificate.crt
COPY nginx/private.key /etc/nginx/ssl/private.key

CMD nginx -g "daemon off;" & sscma.cli server --host 0.0.0.0 --port 8000