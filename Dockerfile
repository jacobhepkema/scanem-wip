# Julia + necessary packages Dockerfile

FROM julia:1.2.0

USER root

# Julia dependencies
# install Julia packages in /opt/julia instead of $HOME
ENV JULIA_DEPOT_PATH=/opt/julia
ENV JULIA_PKGDIR=/opt/julia
ENV JULIA_VERSION=1.0.0

ENV JULIA_PATH /usr/local/julia
ENV PATH $JULIA_PATH/bin:$PATH

RUN mkdir "/opt/"
RUN mkdir "$JULIA_DEPOT_PATH"

RUN julia -e 'using Pkg; Pkg.add(["HDF5", "DataFrames", "ArgParse", "CSV"])'

CMD ["julia"]
