# Alpine SSHD (Dropbear)

[![Docker Repository on Quay](https://quay.io/repository/realeyes/alpine-sftp/status "Docker Repository on Quay")](https://quay.io/repository/realeyes/alpine-sftp)

This is a small Alpine-based container using [openssh-sftp-server](https://pkgs.alpinelinux.org/package/main/x86/openssh-sftp-server) and [Dropbear SSH](https://matt.ucc.asn.au/dropbear/dropbear.html).

The intended usage is to (temporary) access/modify shared volumes by SSH/SFTP.

## Usage

It takes 4 variables: 'USER', 'PASSWORD', 'SETGID', 'SETUID' all in cleartext. Redirect the TCP/22 port to whatever port you want. Example

    docker run -d \
    -p 2222:22 \
    -e USER=myusername \
    -e PASSWORD=mypassword \
    -e SETUID=1008 \
    -e SETGID=1009 \
    quay.io/realeyes/alpine-sftp

Then you can use this container to SFTP and/or SSH:

```
sftp -P2222 user1@192.168.99.100
user1@192.168.99.100's password:
Connected to 192.168.99.100.
sftp> pwd
Remote working directory: /home/user1
sftp>
```

## Dropbear Notes

Options used in this container:

```
-R              Create hostkeys as required
-F              Don't fork into background
-E              Log to stderr rather than syslog
-m              Don't display the motd on login
-w              Disallow root logins
-g              Disable password logins for root
```

## Build

    $ make build
