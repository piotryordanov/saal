sudo mkdir /opt/wineprefix
export WINEDEBUG=-all
export WINEARCH=win64
export WINEPREFIX=/opt/wineprefix
export PYTHON_VERSION=3.10.9
# renovate: datasource=github-releases depName=upx/upx versioning=loose
export UPX_VERSION=3.96
# Install python and needed packages
mkdir /tmp/helper
umask 0 && cd /tmp/helper && \
  curl -LOOO \
    https://www.python.org/ftp/python/${PYTHON_VERSION}/python-${PYTHON_VERSION}-amd64.exe{,.asc} \
    https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-win64.zip \
  && \
  xvfb-run sh -c "\
    wine python-${PYTHON_VERSION}-amd64.exe /quiet TargetDir=C:\\Python310 \
      Include_doc=0 InstallAllUsers=1 PrependPath=1; \
    wineserver -w" && \
  unzip upx*.zip && \
  mv -v upx*/upx.exe ${WINEPREFIX}/drive_c/windows/ && \
  cd .. && rm -Rf helper

# Install some python software
umask 0 && xvfb-run sh -c "\
  wine pip install MetaTrader5 pandas numpy numba pytz pyarrow; \
  wineserver -w"
