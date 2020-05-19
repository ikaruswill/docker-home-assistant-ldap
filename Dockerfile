ARG HOMEASSISTANT_VERSION
FROM homeassistant/home-assistant:${HOMEASSISTANT_VERSION}
RUN apk add --no-cache openldap-clients && \
    wget -O /usr/bin/ldap-auth https://raw.githubusercontent.com/efficiosoft/ldap-auth-sh/master/ldap-auth.sh && \
    chmod 755 /usr/bin/ldap-auth