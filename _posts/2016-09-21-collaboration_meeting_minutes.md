---
layout: default
title:  Collaboration Meeting Minutes
---

XRootD Collaboration Meeting held at CERN 21-September-2016
-----------------------------------------------------------

Attendees:
 * Andreas Peters (CERN)
 * Andrew Hanushevsky (SLAC)
 * Douglas Benjamin (Duke)
 * Elvin Sindrilaru (CERN)
 * Dirk Duellmann (CERN)
 * Girardo Ganis (CERN)
 * Michal Simon (CERN)
 * Wei Yang (SLAC)

Discussion Topics
-----------------

### Current Activities ###

 * Andreas: Working on a distributed key/value store as an XRootD plugin.
Currently, it has a dependency on rocksDB (Facebook). Will look in
making it available via the mainline repository after it is finished.
 * Andrew: Working on quotas, request signing, SSI and sequencing
development activities.
 * Dirk: Analyzing EOS access records with data being dumped into XRootD
for future use.
 * Doug: Most time spent on supporting XRootD at Tier 3 US sites.
 * Elvin: Worked on speeding up matching requests with handlers speedup
in the client.
 * Gerri: Fixing GSI certificate cache race conditions. This may require a
complete revision of certificate caching code. Also plans n doing a timebased
clean up of the certificate cache on theclient side. Finally, extending
the VOMS plug-in to be more extensible.
 * Michal: Extracting files from zip archives (done), metalink support (done),
extreme copy (ongoing), and request signing

### Active Development ###

 * Extreme copy option for xrdcp.
 * Proxy cache.
 * Quotas
 * Scalable Service Interface.
 * Signing requests for improved security.

### Planned Development (near term) ###

 * AuthDB extension to make decisions based on role and organization
membership.
 * kXR_mv extensions to support file names with imbedded spaces.
 * Message interface for XRootD to XRootD messages using the cms
redirection network (quotas need this).
 * Separate timeout for negative response caching in the cmsd.
 * Vector writes in the client interface (identical to writev).

### Planned Development (long term) ###

 * Allow users to set and query extended attributes (may require new
request code for cleaner implementation).
 * Distribution via Docker container.
 * Dynamic file source selection in the client.
 * Proxy delegation for third party copy (use the getfile and putfile request
codes).
 * Redirection trace back on the client when things to awry.
 * Removing lookup delays when opening a file in write mode.
 * Support local files natively via the client (i.e. file:// protocol).
 * User id and group id tracking for authentication protocols that support
uid's and gid's.

### Development Discussion ###

We discussed priorities on this long list of activities. While overall priorities have
not been set, the top items in priority order are:
 * Caching proxy
 * Request signing
 * Quotas
 * Extreme copy

The next release, 4.5, is largely driven by proxy cache availability and request
signing and will be produced when one or the other is done.
The extreme copy may have to wait for request signing.

### Miscellaneous Discussion ###

There was a discussion on what to do with our own version of semaphores
necessitated by the broken implementation in Linux. That implementation was
fixed in Linux 2.18. Unfortunately, this is not available for RHEL releases. We
may have to if-def a patch to use the fixed version or our version depending on
the target compilation. The driving issue is that our version has some problems
that should be fixed in 2.18.

There was some discussion on extending proxy delegation to work for more than
third-party copy. For multi-tenant sites as well as for overall completeness it
would be good if proxy servers used certificate delegation for all operations. We
agreed that this was a good idea and will investigate on how we could
implement it.

### XRootD WorkShop ###

The workshop will be held Novenber 8-10, 2016 at ICEPP, Tokyo. The url is:
[https://indico.cern.ch/event/523410/](https://indico.cern.ch/event/523410/)
