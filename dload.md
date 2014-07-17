---
layout: default
title:  Downloads
tab:    download
---

Source code
-----------

You can get the most recent source tree by cloning our main git repository:

    git clone https://github.com/xrootd/xrootd.git

Please make sure to check for any [**warnings**](docs.html) about known release
issues and other [upgrade information](docs.html) prior to installing a release.
You can also read the [RELEASE NOTES](download/ReleaseNotes.html) and download
the source tarballs:

|Date      |File                                                       |Size         |Checksum                        |Comment      |
|:--------:|:---------------------------------------------------------:|:-----------:|:------------------------------:|:-----------:|
|2014-07-17|[xrootd-4.0.2.tar.gz](/download/v4.0.2/xrootd-4.0.2.tar.gz)|1918407 bytes|8b7a7c46e57f4ce7cf4acb74752f8fa5|Version 4.0.2|
|2014-07-11|[xrootd-4.0.1.tar.gz](/download/v4.0.1/xrootd-4.0.1.tar.gz)|1917956 bytes|8e384d1b6f3eaad16ccce2a829488f07|Version 4.0.1|
|2014-06-05|[xrootd-4.0.0.tar.gz](/download/v4.0.0/xrootd-4.0.0.tar.gz)|1915711 bytes|2fb3c3ac1d683270f2ec5b276e3fa726|Version 4.0.0|
|2014-01-16|[xrootd-3.3.6.tar.gz](/download/v3.3.6/xrootd-3.3.6.tar.gz)|1836866 bytes|2c16a144e938e43cc637b990d317a3f4|Version 3.3.6|
|2013-11-29|[xrootd-3.3.5.tar.gz](/download/v3.3.5/xrootd-3.3.5.tar.gz)|1835874 bytes|c6dc6153e7d08dee67c971aae3b7c101|Version 3.3.5|
|2013-10-11|[xrootd-3.3.4.tar.gz](/download/v3.3.4/xrootd-3.3.4.tar.gz)|1835320 bytes|a98ac5903a9661ac7dff3179bcc4ba36|Version 3.3.4|
|2013-07-24|[xrootd-3.3.3.tar.gz](/download/v3.3.3/xrootd-3.3.3.tar.gz)|1810204 bytes|8c2a2d66a684a8f4395c02ae249f5706|Version 3.3.3|
|2013-04-26|[xrootd-3.3.2.tar.gz](/download/v3.3.2/xrootd-3.3.2.tar.gz)|1829741 bytes|26bcb085913d5245bf27ee59c4fdbce0|Version 3.3.2|
|2013-03-06|[xrootd-3.3.1.tar.gz](/download/v3.3.1/xrootd-3.3.1.tar.gz)|1816739 bytes|8389af6838df7a5d6e5f7a6d10427b9a|Version 3.3.1|
|2013-02-18|[xrootd-3.3.0.tar.gz](/download/v3.3.0/xrootd-3.3.0.tar.gz)|1816594 bytes|37048f6c6f29e3a2398ab95c06e2a63a|Version 3.3.0|
|2012-12-11|[xrootd-3.2.7.tar.gz](/download/v3.2.7/xrootd-3.2.7.tar.gz)|1510630 bytes|32202edc5afd7f726887f5825ae5b0f5|Version 3.2.7|
|2012-11-05|[xrootd-3.2.6.tar.gz](/download/v3.2.6/xrootd-3.2.6.tar.gz)|1509903 bytes|83fda989488851513ccfd34582008289|Version 3.2.6|
|2012-10-04|[xrootd-3.2.5.tar.gz](/download/v3.2.5/xrootd-3.2.5.tar.gz)|1502003 bytes|12f13a484389173994e8ef7344cf0ae6|Version 3.2.5|
|2012-09-10|[xrootd-3.2.4.tar.gz](/download/v3.2.4/xrootd-3.2.4.tar.gz)|1501690 bytes|66fdb9eafaa312446452065b65a0c6c4|Version 3.2.4|
|2012-09-04|[xrootd-3.2.3.tar.gz](/download/v3.2.3/xrootd-3.2.3.tar.gz)|1501530 bytes|9234acc202cb09667fe56cee4b79102b|Version 3.2.3|
|2012-06-18|[xrootd-3.2.2.tar.gz](/download/v3.2.2/xrootd-3.2.2.tar.gz)|1501106 bytes|d940e029524a57b29fa39ee2acbd0f2e|Version 3.2.2|
|2012-05-12|[xrootd-3.2.1.tar.gz](/download/v3.2.1/xrootd-3.2.1.tar.gz)|1500441 bytes|b3f86bb9e10d7a7bd2bc99894e332794|Version 3.2.1|
|2012-04-24|[xrootd-3.2.0.tar.gz](/download/v3.2.0/xrootd-3.2.0.tar.gz)|1500379 bytes|668b88f01a0b01ac0e711d85a77cacdd|Version 3.2.0|

Yum repositories
----------------

We build RPMs for Scientific Linux and make them available through YUM. There
are two types of repositories: a **stable** one - containing only stable
releases, and a **testing** one - serving also release candidates. The repo
files for /etc/yum.repos.d are available below:

* Stable: 
  [xrootd-stable-slc5.repo](/binaries/xrootd-stable-slc5.repo),
  [xrootd-stable-slc6.repo](/binaries/xrootd-stable-slc6.repo)
* Testing:
  [xrootd-testing-slc5.repo](/binaries/xrootd-testing-slc5.repo),
  [xrootd-testing-slc6.repo](/binaries/xrootd-testing-slc6.repo)

Binaries
--------

The binaries for the supported platforms are downloadable here:

{{ "" | tar_gz_files_table }}

Incremental builds
------------------
We build the repository commits incrementally and they are accessible via our
TeamCity portal:

<a href="https://teamcity-dss.cern.ch:8443/guestLogin.html?guest=1">
<img src="images/logo_teamcity.gif" alt="TeamCity logo" width="160" height="40" />
</a>
