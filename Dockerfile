ARG HOMEASSISTANT_VERSION
FROM homeassistant/home-assistant:${HOMEASSISTANT_VERSION}
RUN apk add --no-cache openldap-clients