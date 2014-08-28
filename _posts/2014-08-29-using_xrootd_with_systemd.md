---
layout: default
title:  Using XRootD with systemd
---

Using XRootD with SystemD
-------------------------

Starting with version 4.1.0, XRootD's RPM packaging will provide systemd
configuration files handling all XRootD daemons on RHEL >= 7 and Fedora >= 19.
Since the design principles of systemd differ significantly from those of SysV
init, the way of handling the daemon start up changes quite a bit as well.

All of the XRootD's systemd configuration files are templates, meaning that
they can be used to handle multiple instances of each daemon. Each template
looks for an XRootD configuration file in */etc/xrootd/xrootd-XXXXX.cfg*, where
*XXXXX* is the instance name.

In order to start/enable xrootd daemon instance called *test1*, you need to
do the following:

    # check if you have the corresponding configuration file
    [root@centos7-srv1 ~]# ls -l /etc/xrootd/xrootd-test1.cfg 
    -rw-r--r--. 1 root root 91 Aug 27 12:15 /etc/xrootd/xrootd-test1.cfg

    # start the instance
    [root@centos7-srv1 ~]# systemctl start xrootd@test1.service

    # check the status
    [root@centos7-srv1 ~]# systemctl status xrootd@test1.service
    xrootd@test1.service - XRootD xrootd deamon instance test1
       Loaded: loaded (/etc/systemd/system/xrootd@.service; disabled)
       Active: active (running) since Thu 2014-08-28 12:51:11 CEST; 5s ago
         Docs: man:xrootd(8)
               http://xrootd.org/docs.html
     Main PID: 11624 (xrootd)
       CGroup: /system.slice/system-xrootd.slice/xrootd@test1.service
               └─11624 /usr/bin/xrootd -l /var/log/xrootd/xrootd.log -c /etc/xrootd/xrootd-test1.cfg -k fifo -s /var/run/xrootd/xrootd-test1.pid -n test1

    Aug 28 10:51:11 centos7-srv1 systemd[1]: Starting XRootD xrootd deamon instance test1...
    Aug 28 10:51:11 centos7-srv1 systemd[1]: Started XRootD xrootd deamon instance test1.

    # enable start up on boot
    [root@centos7-srv1 ~]# systemctl enable xrootd@test1.service
    ln -s '/etc/systemd/system/xrootd@.service' '/etc/systemd/system/multi-user.target.requires/xrootd@test1.service'

In order to stop/disable the instance, run:

    # stop the instance
    [root@centos7-srv1 ~]# systemctl stop xrootd@test1.service

    # check the status
    [root@centos7-srv1 ~]# systemctl status xrootd@test1.service
    xrootd@test1.service - XRootD xrootd deamon instance test1
       Loaded: loaded (/etc/systemd/system/xrootd@.service; enabled)
       Active: inactive (dead) since Thu 2014-08-28 12:53:31 CEST; 3s ago
         Docs: man:xrootd(8)
               http://xrootd.org/docs.html
     Main PID: 11624 (code=killed, signal=TERM)

    Aug 28 10:51:11 centos7-srv1 systemd[1]: Starting XRootD xrootd deamon instance test1...
    Aug 28 10:51:11 centos7-srv1 systemd[1]: Started XRootD xrootd deamon instance test1.
    Aug 28 10:53:31 centos7-srv1 systemd[1]: Stopping XRootD xrootd deamon instance test1...
    Aug 28 10:53:31 centos7-srv1 systemd[1]: Stopped XRootD xrootd deamon instance test1.

    # disable start up on boot
    [root@centos7-srv1 ~]# systemctl disable xrootd@test1.service
    rm '/etc/systemd/system/multi-user.target.requires/xrootd@test1.service'

The same can be done for *cmsd*, *frm_xfrd* and *frm_purged* daemons as well.
