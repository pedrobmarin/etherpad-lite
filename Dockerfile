FROM node:9

ADD . app

WORKDIR app

RUN apt-get update \
 && apt-get install -y jq \
 && bin/installDeps.sh \
 && npm -g install jsmin \
 && npm install ep_clear_authorship_no_prompt \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV SETTINGS_MODIFIER "."
ENV NODE_ENV production

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bin/run.sh", "--root"]
