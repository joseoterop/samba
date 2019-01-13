#! /bin/bash
# @edt ASIX-M06
# -----------------
authconfig  --enableshadow --enablelocauthorize --enableldap  --ldapserver='ldap' --ldapbase='dc=edt,dc=org' --enableldapauth  --updateall



