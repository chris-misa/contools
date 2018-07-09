FROM scratch
COPY files /
WORKDIR /owamp
ENV PATH "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV OWAMP_SOURCE_DIR "http://software.internet2.edu/sources/owamp/"
ENV OWAMP_SOURCE_FILE "owamp-3.4-10.tar.gz"
ENTRYPOINT ["./start.sh"]
