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

You can also read the [RELEASE NOTES](download/ReleaseNotes.html) and download
the source tarballs:

|Date      |File                                                       |Size         |Checksum                        |Comment      |
|:--------:|:---------------------------------------------------------:|:-----------:|:------------------------------:|:-----------:|
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
