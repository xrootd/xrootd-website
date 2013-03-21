---
layout: default
title:  Collaboration Meeting Minutes
---

XRootD Collaboration Meeting held at CERN 20-March-2013
-------------------------------------------------------

Attendees:
 * Dirk Duellmann (CERN)
 * Gerardo Ganis (CERN)
 * Andrew Hanushevsky (SLAC)
 * Lukasz Janyst (CERN)
 * Andreas Peters (CERN)
 * Justin Salmon (CERN)

Discussion Topics
-----------------

### Releases ###

The 3.3.1 release was two months late, so we should rethink the release
schedule. Every six months would seem to be more realistic.

 * The 3.3.2 bug fix release expected 1st week of April
 * The 3.3.3 release, no earlier than June unless we find serious problems
 * The 4.0.0 release expected mid-July.

We generally support only the current minor release. We generally support
the last minor release for one year after we produce a major release.

### Next major release ###

The following items are planned for the 4.0.0 major release:

 * IPV6
 * Protocol bridge interface
 * Readv passthrough (Brian Bockelman).
 * I/O throttling plug-in (if we get it from Brian Bockelman)
 * The new client interface will become stable if ready
   - XrdPosix using the new client
   - TXNetFile using the new client
   - xrdcopy will be renamed to xrdcp and the current xrdcp replaces  xrdcpold. 
   - Perhaps a wrapper or command line option for xrdcp to get previous version.

### EPEL conformance ###

EPEL has created the RPMs for 3.3.1 and they are in the EPEL testing
repository for EPEL5, EPEL6 and recent Fedora. They should be available
in the EPEL stable repos soon.

### The git repository ###

We are migrating to GitHub for source in the next few days and bug
tracking before CERN moves to Jira.

### VOMS plug-in ###

The updated VOMS RPM should be available by March 23rd. It is going to
be separately released because it depends on the external VOMS library.
It should go to OSG for US and EPEL for EU. We should touch bases with
David Smith. This RPM will only available for 3.3.x.

### Other items ###

 * Python bindings will be ready for 3.3.2. They  work with Python 2.4 and up
   and be distributed as a separate package. We plan to withdraw the Perl
   bindings.
 * C++11 will be enabled when gcc 4.7 packages become available until then we
   will up the warning level and include server and client compilations to
   catch and fix problems.
 * Exploring client-side plug-in to enable novel data access mechanisms.

