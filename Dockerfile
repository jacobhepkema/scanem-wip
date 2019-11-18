FROM julia:1.2.0

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
	ca-certificates \
        autoconf \
        build-essential \
        git \
        mc \
        nano \
		curl \
	; \
	rm -rf /var/lib/apt/lists/*

ENV JULIA_PROJECT=/microservice

RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add CSV       ;precompile");using CSV'
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add HDF5      ;precompile");using HDF5'
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add DataFrames;precompile");using DataFrames'

CMD ["julia"]
