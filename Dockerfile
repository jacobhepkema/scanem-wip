FROM julia:1.2.0

RUN julia -e 'using Pkg; Pkg.add(["HDF5", "DataFrames", "ArgParse", "CSV"])'

CMD ["julia"]
