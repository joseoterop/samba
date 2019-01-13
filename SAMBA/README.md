

/etc/samba/smb.conf
```
[global]
        workgroup = SAMBA
        security = user

        passdb backend = tdbsam

        printing = cups
        printcap name = cups
        load printers = yes
        cups options = raw

[homes]
        comment = Home Directories
        valid users = %S, %D%w%S
        browseable = No
        read only = No
        inherit acls = Yes

[printers]
        comment = All Printers
        path = /var/tmp
        printable = Yes
        create mask = 0600
        browseable = No

[print$]
        comment = Printer Drivers
        path = /var/lib/samba/drivers
        write list = @printadmin root
        force group = @printadmin
        create mask = 0664
        directory mask = 0775

```
### PRUEBAS

```
[root@host docker]# su - pere
reenter password for pam_mount:
[pere@host ~]$ pwd
/tmp/home/pere
[pere@host ~]$ ll
total 0
drwxr-xr-x. 2 pere users 0 Jan 13 23:44 pere
[pere@host ~]$ mount -t "cifs"
//172.18.0.4/pere on /tmp/home/pere/pere type cifs (rw,relatime,vers=default,cache=strict,username=pere,uid=5001,forceuid,gid=100,forcegid,addr=172.18.0.4,file_mode=0755,dir_mode=0755,soft,nounix,serverino,mapposix,rsize=1048576,wsize=1048576,echo_interval=60,actimeo=1)
[pere@host ~]$ 



```



