FROM node:8-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install -y jq abiword tidy bzip2 \
 && npm -g install jsmin

ADD . app

WORKDIR app

RUN bin/installDeps.sh \
 && npm install ep_better_pdf_export html-pdf ep_delete_after_delay_lite \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV SETTINGS_MODIFIER "."
ENV NODE_ENV production

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bin/run.sh", "--root"]
