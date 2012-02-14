---
layout: default
title:  Development
tab:    development
---

Library versions
----------------

When a library **evolves compatibly**: existing interfaces are preserved, but new ones are added
the library's **minor** version number must be incremented. Since nothing has been done that would
break applications constructed earlier, it is OK for older applications to be linked with the
newer library at run-time.

If the interfaces in a library shared object **change incompatibly**, then the major revision
number associated with the library must be incremented. Doing so will cause run-time linking
errors for the applictions constructed with the older versions of the library and thus will
prevent them from running, as opposed to crashing in an incontrollable way.

More information on library versioning is available
[here](http://www.usenix.org/publications/library/proceedings/als00/2000papers/papers/full_papers/browndavid/browndavid_html/).
