#! /bin/bash
# @edt ASIX M06 2018-2019
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Install Ok"
/usr/sbin/nslcd && echo "nslcd Ok"
/usr/sbin/nscd && echo "nscd Ok"
/usr/sbin/smbd && echo "snmb Ok"
/usr/sbin/nmbd && echo "nmb Ok"
/opt/docker/samba_users.sh && echo "users added Ok"
/opt/docker/installdir.sh  && echo "Install dir Ok"
/bin/bash

