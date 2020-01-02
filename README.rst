=====================
docker-sphinx-texlive
=====================

Docker image for Sphinx PDF build.

build::

   $ docker build --rm -t ftnext/tokibito-sphinx-texlive .

run::

   $ docker run --rm -v /path/to/directory/:/docs/ ftnext/tokibito-sphinx-texlive:latest
