FROM pzlc/openjdk11:v11.al
RUN apk update
RUN apk upgrade
RUN apk add gnupg
ENV PAYARAVERSION=5.2021.4
RUN mkdir --parents /usr/local
RUN wget --quiet \
  "https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara/${PAYARAVERSION}/payara-${PAYARAVERSION}.zip" \
  --output-document=/usr/local/payara-${PAYARAVERSION}.zip
RUN wget --quiet \
  "https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara/${PAYARAVERSION}/payara-${PAYARAVERSION}.zip.asc" \
  --output-document=/usr/local/payara-${PAYARAVERSION}.zip.asc
COPY B158F9887A99E404BD3163434253E9F0B0556B98.asc B158F9887A99E404BD3163434253E9F0B0556B98.asc
RUN gpg2 --import --batch --yes B158F9887A99E404BD3163434253E9F0B0556B98.asc
RUN gpg2 --verify --quiet /usr/local/payara-${PAYARAVERSION}.zip.asc /usr/local/payara-${PAYARAVERSION}.zip
RUN cd /usr/local && unzip -q payara-${PAYARAVERSION}.zip
ENV PAYARAHOME=/usr/local/payara5
ENV PATH=$PAYARAHOME/glassfish/bin:$PATH

