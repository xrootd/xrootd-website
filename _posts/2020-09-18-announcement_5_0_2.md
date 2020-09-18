---
layout: default
title:  Release announcement - 5.0.2
---

Release announcement - 5.0.2
-----------------------------

The XRootD 5.0.2 release has been tagged. Please follow the links
below for the source and the RPMs. Please note that the RPMs have been pushed
to the stable yum repositories.

 * Source: [http://xrootd.org/download/v5.0.2/xrootd-5.0.2.tar.gz](http://xrootd.org/download/v5.0.2/xrootd-5.0.2.tar.gz)
 * RPMs: [http://xrootd.cern.ch/sw/releases/5.0.2/rpms/](http://xrootd.cern.ch/sw/releases/5.0.2/rpms/)
 * Release Notes: [https://github.com/xrootd/xrootd/blob/v5.0.2/docs/ReleaseNotes.txt](https://github.com/xrootd/xrootd/blob/v5.0.2/docs/ReleaseNotes.txt)

Please note: 
  Following patches:
    [OFS] Correct missparsing '+cksio' option to avoid config failure.
    [Server] Strip out explicit plugin version designation with nasty message.
  are addressing the incompatibility with DPM config files introduces in XRootD5.
