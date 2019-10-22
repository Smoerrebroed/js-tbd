FROM centos:7

RUN useradd tbd && mkdir /opt/TBD && chown tbd /opt/TBD
USER tbd
# This Dockerfile requires the TIBCO DV/Jaspersoft ADS installer file 
# in the resources directory below the Dockerfile.
COPY --chown=tbd resources/TIB_tdv_bd_*_linux_x86_64.bin /tmp/TIB_tdv_bd_linux_x86_64.bin
COPY --chown=tbd resources/tbd_server.options /tmp/
RUN chmod +x /tmp/TIB_tdv_bd_linux_x86_64.bin && \
  /tmp/TIB_tdv_bd_linux_x86_64.bin --optionfile /tmp/tbd_server.options && \
  rm /tmp/TIB_tdv_bd_linux_x86_64.bin /tmp/tbd_server.options

# Expose ports. Note that you must do one of the following:
# map them to local ports at container runtime via "-p 9500-9509:9500-9509"
# or use dynamic ports via "-P".
EXPOSE 9500-9509

COPY --chown=tbd resources/entrypoint.sh .
RUN chmod +x ./entrypoint.sh

# # Default CMD executed at container startup
CMD ["./entrypoint.sh"]
