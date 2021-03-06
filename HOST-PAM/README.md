# PAM
## JOSE OTERO PEREZ ESCOLA DEL TREBALL ASIX 


Host pam que crea los homes del usuarios y monta un recurso cifs al mimso se debe usar la opción **--privileged**.

#### Ejecución

```
docker run --rm --name host --hostname host --network ldapnet --privileged -it joterop/host-pam
```

#### fichero system-auth

system-auth:
```
#%PAM-1.0
# This file is auto-generated.
# User changes will be destroyed the next time authconfig is run.
auth        required      pam_env.so
auth        optional      pam_mount.so
auth        sufficient    pam_unix.so nullok use_first_pass
auth        sufficient    pam_ldap.so use_first_pass
auth        required      pam_deny.so

account     sufficient    pam_unix.so broken_shadow
account     sufficient    pam_localuser.so
account     sufficient    pam_succeed_if.so uid < 1000 quiet
account     [default=bad success=ok user_unknown=ignore] pam_ldap.so
account     required      pam_permit.so

password    requisite     pam_pwquality.so try_first_pass local_users_only retry=3 authtok_type=
password    sufficient    pam_unix.so sha512 shadow nullok try_first_pass use_authtok
password    sufficient    pam_ldap.so use_authtok
password    required      pam_deny.so

session     optional      pam_keyinit.so revoke
session     required      pam_limits.so
-session     optional      pam_systemd.so
session     optional      pam_mkhomedir.so
session     [success=1  default=ignore] pam_succeed_if.so uid < 5000
session     optional      pam_mount.so
session     sufficient    pam_unix.so
~                                        
```

pam_mount.conf.xml :
```
<volume user="*" fstype="cifs" server="samba" path="%(USER)" mountpoint="~/%(USER)"
/>
```


#### Pruebas 

```
[root@host docker]# su - pere
Creating directory '/tmp/home/pere'.
reenter password for pam_mount:
[pere@host ~]$ mount -t "cifs"
//samba/pere on /tmp/home/pere/pere type cifs (rw,relatime,vers=default,cache=strict,username=pere,uid=5001,forceuid,gid=100,forcegid,addr=172.18.0.4,file_mode=0755,dir_mode=0755,soft,nounix,serverino,mapposix,rsize=1048576,wsize=1048576,echo_interval=60,actimeo=1)
[pere@host ~]$ su - pau
pam_mount password:
Creating directory '/tmp/home/pau'.
[pau@host ~]$ mount -t "cifs"
//samba/pere on /tmp/home/pere/pere type cifs (rw,relatime,vers=default,cache=strict,username=pere,uid=5001,forceuid,gid=100,forcegid,addr=172.18.0.4,file_mode=0755,dir_mode=0755,soft,nounix,serverino,mapposix,rsize=1048576,wsize=1048576,echo_interval=60,actimeo=1)
//samba/pau on /tmp/home/pau/pau type cifs (rw,relatime,vers=default,cache=strict,username=pau,uid=5000,forceuid,gid=100,forcegid,addr=172.18.0.4,file_mode=0755,dir_mode=0755,soft,nounix,serverino,mapposix,rsize=1048576,wsize=1048576,echo_interval=60,actimeo=1)
[pau@host ~]$ su - marta
pam_mount password:
Creating directory '/tmp/home/marta'.
[marta@host ~]$ 


```


