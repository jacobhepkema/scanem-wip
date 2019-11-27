Bootstrap: docker
From: julia:1.2.0

%help
    Julia 1.2

%labels
    Maintainer @jacobhepkema
    Version v0.9

%post
    JULIA_PKGDIR=/opt/julia
    JULIA_VERSION=1.2.0
    export JULIA_DEPOT_PATH=/opt/julia
    export JULIA_PATH=/usr/local/julia
    export PATH=$JULIA_PATH/bin:$PATH

    mkdir -p "$JULIA_DEPOT_PATH"

    julia -e 'using Pkg;pkg"add Dates Parsers PooledArrays WeakRefStrings FilePathsBase LazyArrays Libdl Mmap CategoricalArrays Missings InvertedIndices Tables TableTraits IteratorInterfaceExtensions DataAPI Unicode SortingAlgorithms Reexport TextWrap Compat Blosc ArgParse DataFrames CSV Profile Random Statistics HDF5;precompile"'

    chmod -R 777 /opt
    chmod -R 777 /usr/local/julia

%environment
    export JULIA_DEPOT_PATH=/opt/julia
    export JULIA_PKGDIR=/opt/julia
    export LC_ALL=C.UTF-8
    export LANG=C.UTF-8
    export JULIA_PATH=/usr/local/julia
    export PATH=$JULIA_PATH/bin:$PATH

# smoke test
julia --version

%runscript
    exec julia -e "$@"
