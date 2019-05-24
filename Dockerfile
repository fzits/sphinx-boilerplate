FROM python:3.7-slim-stretch

WORKDIR /sphinx

RUN apt-get update \
    && apt-get install -y \
        make \
        nginx \
    && pip install \
        Sphinx \
        sphinx_glpi_theme

COPY nginx.conf .

CMD ["nginx", "-p", "./", "-c", "nginx.conf"]
