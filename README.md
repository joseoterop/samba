### Creación de una red de dockers capaz de exportar recursos mediante SAMBA

Esta practica tiene como objetivo crear un contenedor samba capaz de exportar recursos, en este caso, 
en concreto exportamos los `homes`de los usuarios tanto locales como de ldap.



inicio de los contenedores:

**LDAP** docker run --rm --name ldap -h ldap --net ldapnet -d edtasixm06/ldapserver:18group

**HOSTPAM** docker run --rm --name host -h host --net ldapnet --privileged -it joterop/host-pam-samba

**SAMBA** docker run --rm --name samba -h samba --net ldapnet -it joterop/samba-only



