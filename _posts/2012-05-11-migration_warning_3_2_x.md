---
layout: default
title:  Warning for sites upgrading to 3.2.x
---

Warning for sites upgrading to 3.2.x
------------------------------------

There was a bug found in the FRM mechanism, such that attempts to stage-in
missing files upon open() or via xrdstagetool will hang. **Sites using the
frm for real-time staging should stick with the 3.1.1 release.**
