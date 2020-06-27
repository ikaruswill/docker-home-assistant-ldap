ARG HOMEASSISTANT_VERSION
FROM homeassistant/home-assistant:${HOMEASSISTANT_VERSION}
RUN apk add --no-cache openldap-clients \
    && wget -O /usr/bin/ldap-auth https://raw.githubusercontent.com/efficiosoft/ldap-auth-sh/master/ldap-auth.sh \
    && sed -i 's/^.*CLIENT=.*/CLIENT=ldapsearch/g' /usr/bin/ldap-auth \
    && printf '\n\
    on_auth_success() { \n\
        if [ ! -z "$NAME_ATTR" ]; then \n\
            name=$(echo "$output" | sed -nr "s/^\s*$NAME_ATTR:\s*(.+)\s*\$/\1/Ip") \n\
            [ -z "$name" ] || echo "name=$name" \n\
        fi \n\
    }\n' >> /usr/bin/ldap-auth \
    && chmod 755 /usr/bin/ldap-auth