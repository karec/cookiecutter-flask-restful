FROM postgres

COPY ./postgres_seed.sh /
COPY ./eventador.sql /
COPY ./wait-for-it.sh /tmp/wait-for-it.sh
RUN chmod +x /tmp/wait-for-it.sh
WORKDIR /

ENTRYPOINT ["/tmp/wait-for-it.sh", "postgresdb:5432", "--"]

CMD bash postgres_seed.sh