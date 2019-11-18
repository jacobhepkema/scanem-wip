FROM julia:1.2.0

EXPOSE 8888 

RUN apt-get update
# to get python(Anaconda) via PyCall
RUN apt-get install -yq bzip2 python3-tk
# to build PackageCompiler
RUN apt-get install -yq build-essential

# Prepare Julia Packages
RUN julia -e 'ENV["PYTHON"]=""; using Pkg;Pkg.add(["HDF5", "DataFrames", "ArgParse", "CSV"])'
# enable to call python and jupyter from bash
ENV PATH="/root/.julia/conda/3/bin:$PATH:${PATH}"
