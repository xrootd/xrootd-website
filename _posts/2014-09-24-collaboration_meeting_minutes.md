---
layout: default
title:  Collaboration Meeting Minutes
---

XRootD Collaboration Meeting held at CERN 24-September-2014
-----------------------------------------------------------

Attendees:
 * Dirk Duellmann (CERN)
 * Andrew Hanushevsky (SLAC)
 * Gerardo Ganis (CERN)
 * Lukasz Janyst (CERN)
 * Andreas Peters (CERN)

Discussion Topics
-----------------

### Release 4.1 ###

Generally, Release 4.0 has become a deployment failure. This is strictly due
to the fact that installing R4 required that R3 be de-installed and most people
wanted to be able to keep both versions to ease migration. To address this
problem significant structural changes are being made to R4.1 to support
co-existence of multiple previous major releases. This generally means that
plug-in shared libraries will now be versioned as well and that we forbid
linking against plug-in libraries, as there really is no reason to do so (i.e.
they can only be dynamically loaded).

The rule is that Rn.x also installs the libraries for R(n-1).x for backward
compatibility for existing binaries. Hence, release 4.1.x will also install
the R3.3.6 libraries (the most recent R3).

### Release 4.1 ###

Scheduled for October.

### ROOT & XRootD ###

Over the years both packages have become entangled to the extent that people are
confused as to what version to ROOT goes with what version of XRootD. The ROOT
team tried to solve this via static linking in release 5.34.20 but it didn't
actually work well because XRootD does not have any statics available.
Hence, the the agreement was made that the ROOT team packages the appropriate
version of XRootD libraries that are necessary to run ROOT and PROOF to allow
the ROOT/PROOF client to run without any additional effort. They are still
checking to make sure that they only use public headers to avoid any install
conflicts. 

There is still a desire by many people to know what ROOT version pairs up with
what XRootD version. The short table is:

 * Root 5.34.21 works with Xroot 3.3.6
 * Root 6.02.00 works with Xroot 4.0.3
 * Root 6.04.00 works with Xroot 4.1.x

**Action Item:** Andrew Hanushevsky will create a compatibility table with the
ROOT team and post it on the XRootD web site.

### XRootD WorkShop ###

The workshop will be held January 27-29, 2015 at UCSD. The url is:
[https://indico.cern.ch/event/330212/](https://indico.cern.ch/event/330212/)

The XRootD Workshop's goal is to focus on XRootD usage not only for HEP
experiments but also for communities outside of HEP. This does not replace the
Federated Workshop which is likely to be held later in the year. Some relevant
topics that will be covered by collaboration members would be:

 * GSI Security - Gerri Ganis to present what is needed, what should be
   configured, and what can go wrong.
 * EOS - Andreas Peters to present where XRootD fits in and how to configure it.
 * R4 Client - Lukasz Janyst - how to configure the client at the local and site
   levels.
 * Caching Proxy - Matevz Tadel - what it does and how to maximize it use.
 * Ceph - Sebastien Ponce - configuration and usage.

### Staff Changes ###

Lukasz Janyst is scheduled to leave by end of April 2015. CERN will post a new
job for XRootD position to take over Lukasz's responsibilities.

### Miscellaneous ###

Apple will replace OpenSSL and Kerberos with their own APIs and libraries. This
directly impacts XRootD and Gerri Ganis will look into how to migrate to the
new scheme. Something similar may occur in Linux, if Linux decides to use
LibreSSL libraries which are likely to diverge from OpenSSL over time.
