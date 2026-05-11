module load \
  mkl/2022.1.0 \
  intel/2023.2.1-magic

module use /usr/workspace/e3sm/spack/dane/intel/modules/Core

module load \
  intel-oneapi-runtime/2023.2.0 \
  gcc-runtime/12.1.1 \
  glibc/2.28 \
  mvapich2/2.3.7

{%- if use_system_package('hdf5') %}
module load hdf5/1.14.5
{%- endif %}
{%- if use_system_packages('netcdf-c', 'netcdf-fortran') %}
module load netcdf-c/4.9.2 netcdf-fortran/4.6.1
{%- endif %}
{%- if use_system_package('parallel-netcdf') %}
module load parallel-netcdf/1.14.0
{%- endif %}
