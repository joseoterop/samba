#! /bin/bash
# @edt ASIX M06 2018-2019
# USUARIOS
# -------------------------------------

useradd lila
useradd pla
useradd patipla
useradd rock

echo -e "smbpla\nsmbpla" | smbpasswd -a pla
echo -e "smbpatipla\nsmbpatipla" | smbpasswd -a patipla
echo -e "smbrock\nsmbrock" | smbpasswd -a rock
echo -e "smblila\nsmblila" | smbpasswd -a lila
echo -e "smbpere\nsmbpere" | smbpasswd -a pere
echo -e "smbpau\nsmbpau" | smbpasswd -a pau
echo -e "smbmarta\nsmbmarta" | smbpasswd -a marta


