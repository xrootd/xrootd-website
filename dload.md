---
layout: default
title:  Downloads
tab:    download
---

Source code
-----------

You can get the most recent source tree by cloning our main git repository:

    git clone http://xrootd.org//repo/xrootd.git

or a [browsable](http://xrootd.cern.ch/repos/xrootd.git/) mirror at CERN:

    git clone http://xrootd.cern.ch/repos/xrootd.git

Please make sure to check for any [warnings](docs.html) about known release
issues and other [upgrade information](docs.html) prior to installing a release.
You can also read the [RELEASE NOTES](download/ReleaseNotes.html) and download
the source tarballs:

|Date      |File                                                       |Size         |Checksum                        |Comment      |
|:--------:|:---------------------------------------------------------:|:-----------:|:------------------------------:|:-----------:|
|2012-12-11|[xrootd-3.2.7.tar.gz](/download/v3.2.7/xrootd-3.2.7.tar.gz)|1510630 bytes|32202edc5afd7f726887f5825ae5b0f5|Version 3.2.7|
|2012-11-05|[xrootd-3.2.6.tar.gz](/download/v3.2.6/xrootd-3.2.6.tar.gz)|1509903 bytes|83fda989488851513ccfd34582008289|Version 3.2.6|
|2012-10-04|[xrootd-3.2.5.tar.gz](/download/v3.2.5/xrootd-3.2.5.tar.gz)|1502003 bytes|12f13a484389173994e8ef7344cf0ae6|Version 3.2.5|
|2012-09-10|[xrootd-3.2.4.tar.gz](/download/v3.2.4/xrootd-3.2.4.tar.gz)|1501690 bytes|66fdb9eafaa312446452065b65a0c6c4|Version 3.2.4|
|2012-09-04|[xrootd-3.2.3.tar.gz](/download/v3.2.3/xrootd-3.2.3.tar.gz)|1501530 bytes|9234acc202cb09667fe56cee4b79102b|Version 3.2.3|
|2012-06-18|[xrootd-3.2.2.tar.gz](/download/v3.2.2/xrootd-3.2.2.tar.gz)|1501106 bytes|d940e029524a57b29fa39ee2acbd0f2e|Version 3.2.2|
|2012-05-12|[xrootd-3.2.1.tar.gz](/download/v3.2.1/xrootd-3.2.1.tar.gz)|1500441 bytes|b3f86bb9e10d7a7bd2bc99894e332794|Version 3.2.1|
|2012-04-24|[xrootd-3.2.0.tar.gz](/download/v3.2.0/xrootd-3.2.0.tar.gz)|1500379 bytes|668b88f01a0b01ac0e711d85a77cacdd|Version 3.2.0|
|2012-03-05|[xrootd-3.1.1.tar.gz](/download/v3.1.1/xrootd-3.1.1.tar.gz)|1501295 bytes|6466b12a99aed3f8ea0b56b5b3ace093|Version 3.1.1|
|2011-10-21|[xrootd-3.1.0.tar.gz](/download/v3.1.0/xrootd-3.1.0.tar.gz)|1496093 bytes|471bbc73ea1fc4879bf325c0eae3c62b|Version 3.1.0|
|2011-09-07|[xrootd-3.0.5.tar.gz](/download/v3.0.5/xrootd-3.0.5.tar.gz)|1748259 bytes|c4b084a994363186629eefe8e102668f|Version 3.0.5|
|2011-06-14|[xrootd-3.0.4.tar.gz](/download/v3.0.4/xrootd-3.0.4.tar.gz)|1747946 bytes|cd260d0ea347fcc029ad6ad092667d05|Version 3.0.4|
|2011-04-13|[xrootd-3.0.3.tar.gz](/download/v3.0.3/xrootd-3.0.3.tar.gz)|1738150 bytes|f857ba6303f2e821420553f8e54ee188|Version 3.0.3|
|2011-01-26|[xrootd-3.0.2.tar.gz](/download/v3.0.2/xrootd-3.0.2.tar.gz)|1697106 bytes|98a30a9d84dc24da4cae51ed26965f5b|Version 3.0.2|

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
