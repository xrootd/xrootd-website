---
layout: default
title:  Warning for sites using dCache as an xrdcp target and upgrading to 4.x.x
---

Warning for sites using dCache as an xrdcp target and upgrading to 4.x.x
------------------------------------------------------------------------

The 4.x.x version of xrdcp does not create missing directories when copying
into a dCache system. This is a major compatability issue if you have relied
on this feature. We are in the process of resolving this issue which may 
result in issuing nea 4.1.3 and 4.2.1 releases.

The current bypass is to use xrdcp-old when copying to dCache as this command
is based on a 3.3.6 release and does create mssing directories. Be aware that
that this does not affect native XRootD servers.
