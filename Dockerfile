# vim:set ft=dockerfile:

# Do not edit individual Dockerfiles manually. Instead, please make changes to the Dockerfile.template, which will be used by the build script to generate Dockerfiles.

FROM cimg/base:2022.08

LABEL maintainer="Community & CI Engineering team <community-engg@harness.io>"

RUN sudo apt-get update && sudo apt-get install -y \
		build-essential \
		ca-certificates \
		curl \
		git \
		libbz2-dev \
		liblzma-dev \
		libncurses5-dev \
		libncursesw5-dev \
		libreadline-dev \
		libffi-dev \
		libsqlite3-dev \
		libssl-dev \
		libxml2-dev \
		libxmlsec1-dev \
		llvm \
		make \
		python-openssl \
		tk-dev \
		wget \
		xz-utils \
		zlib1g-dev && \
	curl https://pyenv.run | bash && \
	sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN env PYTHON_CONFIGURE_OPTS="--enable-shared --enable-optimizations" pyenv install 3.10.6 && pyenv global 3.10.6

RUN python --version && \
	pip --version && \
	# This installs pipenv at the latest version, currently 2020.6.2
	pip install pipenv wheel

# This installs version poetry at the latest version. poetry is updated about twice a month.
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
