# Julia + necessary packages Dockerfile

FROM julia:1.2.0

USER root

# Julia dependencies
# install Julia packages in ~/julia_packages instead of default (~/.julia?)

ENV JULIA_DEPOT_PATH=/opt/julia
ENV JULIA_PKGDIR=/opt/julia
ENV JULIA_VERSION=1.2.0

ENV JULIA_PATH /usr/local/julia
ENV PATH $JULIA_PATH/bin:$PATH

RUN mkdir -p "$JULIA_DEPOT_PATH"

RUN julia -e 'using Pkg; Pkg.add(["Dates", "Parsers", "PooledArrays", "WeakRefStrings", "FilePathsBase", "LazyArrays", "Libdl", "Mmap", "CategoricalArrays", "Missings", "InvertedIndices", "Tables", "TableTraits", "IteratorInterfaceExtensions", "DataAPI", "Unicode", "SortingAlgorithms", "Reexport", "TextWrap", "Compat", "Blosc", "ArgParse", "DataFrames", "CSV", "Profile", "Random", "Statistics", "HDF5"])'

RUN julia -e "Base.compilecache(Base.PkgId(\"ArgParse\"))" && \
    julia -e "Base.compilecache(Base.PkgId(\"HDF5\"))" && \
    julia -e "Base.compilecache(Base.PkgId(\"Profile\"))" && \
    julia -e "Base.compilecache(Base.PkgId(\"DataFrames\"))" && \
    julia -e "Base.compilecache(Base.PkgId(\"CSV\"))" && \
    julia -e "Base.compilecache(Base.PkgId(\"Statistics\"))" 

CMD ["julia"]
