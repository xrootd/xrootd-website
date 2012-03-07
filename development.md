---
layout: default
title:  Development
tab:    development
---

Releases and release procedure
------------------------------

The release snapshots of current developments will be built four times a year,
at the end of each quarter. Each 'master' release is preceded by one or more
release candidates that get tested for bugs and deployment issues in a possibly
wide range of environments. When the release candidates are deemed sufficiently
stable, then the final release is built.

Additionally to the 'master' releases, bugfix releases may be built at
the end of each month. These are for bug fixes only, so they normally should
not need release candidates (due to reduced need of testing).

RPM packages are built for each release, including release candidates. All
the packages are pushed to the testing yum repository. Additionally, all
the bug fix releases and all the final 'master' releases are pushed to the
stable repository. See the [download](/dload.html) page for details.

The following releases are planned for this year:

 * release 3.2.0-rc1 on 26.03.2012
 * release 3.3.0-rc1 on 25.06.2012
 * release 3.4.0-rc1 on 24.09.2012
 * release 3.5.0-rc1 on 02.12.2012

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
[here](http://www.usenix.org/publications/library/proceedings/als00/2000papers/papers/full_papers/browndavid/browndavid_html/)
and [here](http://www.akkadia.org/drepper/dsohowto.pdf).
