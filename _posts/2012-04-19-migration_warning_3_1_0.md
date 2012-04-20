---
layout: default
title:  Warning for sites upgrading to 3.1.0 or higher
---

Warning for sites upgrading to 3.1.0 or higher
----------------------------------------------

 1. XRootD releases 3.1.0 or higher use extended attributes to record special
    meta-data information. If your file system does not allow extended attribute
    (see note 2) and you are using multiple partitions, all new file creation
    requests will place the file data in the name space partition. This will
    likely fill up this partition and make space recovery much more difficult
    unless you are using extended architecture (XA) space partitions (see
    note 3).

 2. The only way we have discovered to make sure that your file systems
    support extended attributes is to specify that you want support in
    /etc/fstab by addning the **user_xattr** option as follows:

        /dev/partition /mount fstype defaults,user_xattr 1 2


    Make the appropriate substitutions for partition (e.g hda3), /mount, and
    fstype (e.g. ext3, ext4, xfs, etc). After you make the change your can
    remount the file system as root by issuing:

         mount -o remount /mount

 3. If you are running with multiple partitions and use the oss.cache directive
    without the xa option, (e.g. oss.cache public /data1) you are running with
    non-XA spaces. Non-XA spaces severely limit how space is managed by xrootd.
    You should strongly consider either migrating to an XA-space or adding the
    oss.runmodeold directive to your configuration file in order to run in
    backward compatibility mode. Failure to do so before restarting a new
    version of xrootd will make future conversions more difficult.

 4. Please read the “Migrating to Extended Attribute Name and Data Spaces” guide:
    [http://www.xrootd.org/doc/prod/frm_migr.htm#_Toc284350518](http://www.xrootd.org/doc/prod/frm_migr.htm#_Toc284350518)
    before you run servers using release 3.1.0 or higher and if any of the
    following are true:

     * Your configuration file contains an oss.cache directive,
     * You have specified the migrate, purge, or stage option on any all.export
       directive, or
     * You have pinned or memory mapped any file.

 5. If you do use a non-XA space we strongly recommend that you convert to an
    XA space as soon as possible. While not specifically noted in the migration
    guide, you must change all oss.cache directives to oss.space directives
    after you do a space conversion.
