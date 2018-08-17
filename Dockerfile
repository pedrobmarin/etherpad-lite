FROM node:9

ENV NODE_ENV production

ADD . etherpad-lite

WORKDIR etherpad-lite

ENV SETTINGS_MODIFIER "."

RUN apt-get update \
 && apt-get install -y jq \
 && bin/installDeps.sh \
 && npm -g install jsmin \
 && npm install ep_clear_authorship_no_prompt

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bin/run.sh", "--root"]
