---
layout: default
title:  Development
tab:    development
---

Releases and release procedure
------------------------------

The release snapshots of current developments will normally be built two times
per year. Each 'master' release is preceded by one or more release candidates
that get tested for bugs and deployment issues in a possibly wide range of
environments. When the release candidates are deemed sufficiently stable, then
the final release is built.

Additionally to the 'master' releases, bugfix releases may be built at
when needed. These are for bug fixes only, so they normally should
not need release candidates (due to reduced need of testing).

RPM packages are built for each release, including release candidates. All
the packages are pushed to the testing yum repository. Additionally, all
the bug fix releases and all the final 'master' releases are pushed to the
stable repository. See the [download](/dload.html) page for details.

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

**The project policy is that a change to public interfaces (as defined in the installed
headers) requires a major release - bumping the major version number.**
