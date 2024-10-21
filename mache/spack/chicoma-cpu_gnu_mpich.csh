setenv http_proxy http://proxyout.lanl.gov:8080/
setenv https_proxy http://proxyout.lanl.gov:8080/
setenv ftp_proxy http://proxyout.lanl.gov:8080
setenv HTTP_PROXY http://proxyout.lanl.gov:8080
setenv HTTPS_PROXY http://proxyout.lanl.gov:8080
setenv FTP_PROXY http://proxyout.lanl.gov:8080

source /usr/share/lmod/lmod/init/csh

module rm cray-hdf5-parallel \
          cray-netcdf-hdf5parallel \
          cray-parallel-netcdf \
          cray-netcdf \
          cray-hdf5 \
          intel \
          intel-oneapi \
          nvidia \
          aocc \
          cudatoolkit \
          climate-utils \
          cray-libsci \
          craype \
          craype-accel-nvidia80 \
          craype-accel-host \
          perftools-base \
          perftools \
          darshan \
          PrgEnv-gnu \
          PrgEnv-intel \
          PrgEnv-nvidia \
          PrgEnv-cray \
          PrgEnv-aocc

# we must load cray-libsci for gcc to work
module load PrgEnv-gnu/8.5.0 \
            gcc/12.2.0 \
            cray-libsci/23.05.1.4 \
            craype-accel-host \
            cray-mpich/8.1.26 \
            craype \
            cmake/3.27.7
{% if e3sm_hdf5_netcdf %}
module load cray-hdf5-parallel/1.12.2.3 \
            cray-netcdf-hdf5parallel/4.9.0.3 \
            cray-parallel-netcdf/1.12.3.3
{% endif %}

setenv MPICH_ENV_DISPLAY 1
setenv MPICH_VERSION_DISPLAY 1
## purposefully omitting OMP variables that cause trouble in ESMF
# setenv OMP_STACKSIZE 128M
# setenv OMP_PROC_BIND spread
# setenv OMP_PLACES threads
setenv HDF5_USE_FILE_LOCKING FALSE
setenv PERL5LIB /usr/projects/climate/SHARED_CLIMATE/software/chicoma-cpu/perl5-only-switch/lib/perl5
setenv PNETCDF_HINTS "romio_ds_write=disable;romio_ds_read=disable;romio_cb_write=enable;romio_cb_read=enable"
setenv FI_CXI_RX_MATCH_MODE software
setenv MPICH_COLL_SYNC MPI_Bcast

# for standalone MPAS builds
setenv GNU_CRAY_LDFLAGS "-Wl,--enable-new-dtags"

setenv LD_LIBRARY_PATH="/opt/cray/pe/gcc/12.2.0/snos/lib64:${CRAY_LD_LIBRARY_PATH}:${LD_LIBRARY_PATH}"
