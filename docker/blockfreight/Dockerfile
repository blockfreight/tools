FROM busybox
#Use --build-arg to change where the blockfreight binary resides
ARG BLOCKFREIGHT_BINARY=blockfreight
ENV BCHOME /blockfreight
COPY $BLOCKFREIGHT_BINARY /usr/bin/blockfreight
RUN adduser -h $BCHOME -D blockfreight
VOLUME [ $BCHOME ]
EXPOSE 46658
USER blockfreight
ENTRYPOINT ["/usr/bin/blockfreight"]
CMD ["start","--without-tendermint"]
WORKDIR $BCHOME
STOPSIGNAL SIGTERM

