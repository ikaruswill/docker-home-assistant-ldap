# docker-home-assistant-ldap
Home assistant docker image with added ldap authentication support

## Usage
1. Define the following environment variables:
    1. username
    1. password
1. Adapt settings in [config.cfg](example/config.cfg) to fit your infrastructure
1. Add the following entry to your home-assistant's configuration.yml 
    ```
    homeassistant:
      auth_providers:
      - type: command_line
        command: ldap-auth
        args: ["/path/to/your/config.cfg"]
        # Uncomment and see below if you want the Home Assistant
        # user to be populated with his full name.
        #meta: true
    ```
1. Run the docker image `ikaruswill/home-assistant-ldap` in place of `home-assistant` with a volume mount containing your `config.cfg`

## Environment
| Variable | Description                             |
|----------|-----------------------------------------|
| username | username to bind as for searching       |
| password | password of the user used for searching |

## Configuration

### Required
| Variable | Description                                                            |
|----------|------------------------------------------------------------------------|
| SERVER   | Full address to your ldap server in the form: protocol://hostname:port |
| USER_DN  | Format to use for the DN of your users                                 |

### Optional
| Variable         | Description                                                |
|------------------|------------------------------------------------------------|
| BASEDN           | Base DN to search for users in (if filtering required)     |
| SCOPE            | Scope to search for users in (if filtering required)       |
| FILTER           | Query to search for user with (if filtering required)      |
| NAME_ATTR        | Attribute to pull user's Home-assistant friendly name from |
| TIMEOUT          | Maximum number of seconds to wait for a response from LDAP |
| USERNAME_PATTERN | Regex to validate usernames, unset to disable validation   |