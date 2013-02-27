---
layout: default
title:  Warning for sites using PROOF & ROOT upgrading to 3.3.0
---

Warning for sites using PROOF upgrading to 3.3.0
------------------------------------------------

We have encountered a binary incompatibility issue in one of the private
xrootd classes used by PROOF and ROOT which may applications using 3.3.0
to crash unless they are recompiled. We do not advise recompiling any
applications and to wait until this issue is resolved in xrootd 3.3.1
which is currently being tested. Be aware that if you recompile for 3.3.0
you will need to recompile again for 3.3.1.
