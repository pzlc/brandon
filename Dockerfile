FROM pzlc/openjdk11:v4
RUN dnf upgrade --refresh --assumeyes
ENV PAYARAVERSION=5.201
RUN mkdir --parents /usr/local
RUN wget --quiet \
  "https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara/${PAYARAVERSION}/payara-${PAYARAVERSION}.zip" \
  --output-document=/usr/local/payara-${PAYARAVERSION}.zip
RUN cd /usr/local && unzip -q payara-${PAYARAVERSION}.zip
ENV PAYARAHOME=/usr/local/payara5
ENV PATH=$PAYARAHOME/glassfish/bin:$PATH

