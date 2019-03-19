#! /bin/bash
# @edt ASIX M06 2018-2019
# USUARIOS
# -------------------------------------

useradd lila
useradd pla
useradd patipla
useradd rock

echo -e "smbpla\npla" | smbpasswd -a pla
echo -e "smbpatipla\npatipla" | smbpasswd -a patipla
echo -e "smbrock\nrock" | smbpasswd -a rock
echo -e "smblila\nlila" | smbpasswd -a lila
echo -e "smbpere\npere" | smbpasswd -a pere
echo -e "smbpau\npau" | smbpasswd -a pau
echo -e "smbmarta\nmarta" | smbpasswd -a marta


