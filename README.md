### Creación de un Docker Samba

En una red común, en nuestro caso `ldapnet` se construye un contenedor Samba capaz de exportar los homes de los usuarios,
tanto locales como ldap.
Para exportar los de ldap tendremos que crear sus `homes` de manera manual y otorgarles los permisos necesarios o mediante un script:
```
mkdir /tmp/home/pere
chown -R pere.usuaris /tmp/home/pere

```
El contenedor `Samba` tiene que ser capaz de utilizar la orden `getent` por lo que tendrá que tener en su interior los demonios
`nscd` y `nslcd` funcionando de manera adecuada (HINT: mirar HOST-PAM documentation)

### Modificaciones en el Host-PAM

instalar el paquete CIFS-UTILS
en el fichero `/etc/security/pam_mount.conf.xml tenemos que agegar la siguiente linea:

```
<volume user="*" fstype="cifs" server="samba" path="%(USER)"  mountpoint="~/%(USER)" />

```
inicio de los contenedores:
**LDAP** docker run --rm --name ldap -h ldap --net ldapnet -d edtasixm06/ldapserver:18group
**HOSTPAM** docker run --rm --name samba -h samba --net ldapnet -it joterop/m06pam 



