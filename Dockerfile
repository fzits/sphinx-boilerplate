FROM python:3.7-slim-stretch

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes

WORKDIR /sphinx

RUN set -eu \
    && apt-get update \
    && apt-get install -y \
        make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install \
        Sphinx \
        sphinx-autobuild \
        sphinx_rtd_theme

EXPOSE 8080
CMD sphinx-autobuild -b html --host 0.0.0.0 --port 8080 --poll /sphinx/source /sphinx/build/html
