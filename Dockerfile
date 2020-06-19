FROM pzlc/openjdk11:v5.1.al
RUN apk update
RUN apk upgrade
ENV PAYARAVERSION=5.2020.2
RUN mkdir --parents /usr/local
RUN wget --quiet \
  "https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara/${PAYARAVERSION}/payara-${PAYARAVERSION}.zip" \
  --output-document=/usr/local/payara-${PAYARAVERSION}.zip
RUN cd /usr/local && unzip -q payara-${PAYARAVERSION}.zip
ENV PAYARAHOME=/usr/local/payara5
ENV PATH=$PAYARAHOME/glassfish/bin:$PATH

