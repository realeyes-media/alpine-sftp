#!/bin/sh

# Checks for USER variable
if [ -z "$USER" ]; then
  echo >&2 'Please set an USER variable (ie.: -e USER=john).'
  exit 1
fi

# Checks for PASSWORD variable
if [ -z "$PASSWORD" ]; then
  echo >&2 'Please set a PASSWORD variable (ie.: -e PASSWORD=hackme).'
  exit 1
fi

# Checks for SETUID variable
if [ -z "$SETUID" ]; then
  echo >&2 'Please set a SETUID variable (ie.: -e SETUID=1007).'
  exit 1
fi

# Checks for SETGID variable
if [ -z "$SETGID" ]; then
  echo >&2 'Please set a SETGID variable (ie.: -e SETGID=1009).'
  exit 1
fi

echo "Creating user ${USER}"
adduser -D --uid ${SETUID} --gid ${SETGID} ${USER}
echo "${USER}:${PASSWORD}" | chpasswd
echo "Fixing permissions for user ${USER}"
chown -R ${SETUID}:${SETGID} /home/${USER}
exec "$@"
