---
layout: default
title:  Collaboration Meeting Minutes
---

XRootD Collaboration Meeting held at CERN 29-October-2013
---------------------------------------------------------

Attendees:
 * Douglas Benjamin (Duke)
 * Dirk Duellmann (CERN)
 * Gerardo Ganis (CERN)
 * Andrew Hanushevsky (SLAC)
 * Lukasz Janyst (CERN)
 * Andreas Peters (CERN)
 * Fons Rademakers (CERN)

Discussion Topics
-----------------

### Release 3.3.4 ###
No RPM compatibility issues have been found. It provides a smooth installation
transition.

### Release 3.3.5 ###
We are planning another patch release. Minimally, this will contain:

 * Patch for XrdSysIOEvents to prevent random (negligible in practice) failures
   during forking,
 * Removal of XrdSysIOEvents.hh from the public headers as it was mistakenly
   included and would never compile as the corresponding ".icc" were not
   released,
 * Increase the allowable site name length to 63 characters (it's 15 now).
 * Possible solution to SL6 memory allocation problems (see topic below).

### SL6 Memory Allocation Issues ###

Due to the change in glibc malloc in SL6, heavily threaded programs may see
a dramatic increase in virtual memory use (not real memory). This can cause
batch job cancellation on many sites and causes severe problems for PROOF
jobs on nodes with limited swap space.

The immediate solution is to set the special envar MALLOC_ARENA_MAX to a value
of 1 for client jobs and 4 for the servers. This must be set before the
program starts. This is not particularly practical in many cases and requires
a consultation every time someone experiences this problem. 

The long term solution is to switch to a better memory allocator. Two are
available: tcmalloc (Google) and jemalloc (Facebook). Of the two, it appears
the jemalloc is superior. Unfortunately, neither of  these are natively
installed as part of the Linux distribution and require a separate RPM
install. Furthermore, it is difficult, to link the special malloc library
ahead of glibc and requires that it be set in the LD_PRELOAD envar prior
to running a program.

Fortunately, Atlas makes tcmalloc the default for Athena jobs and CMS makes
jemalloc the default for CMSW jobs. That leaves a swath of others exposed.

#### The action items we are undertaking to address this issue: ####

 * Gerri will notify Alice that their framework should switch to an alternate
   malloc for their root jobs.
 * Gerri will switch PROOF to use jemalloc in the 5.34.11 release for November
   1st.
 * Fons will document how the root framework can be configured to use an
   alternate allocator during the build process and use preload with an RPM
   install.
 * Lukasz will change the sysinit script to attempt a preload for jemalloc or
   tcmalloc (depending on which is installed) during server start-up and issue
   a warning if neither is found (on SLC6).
 * Lukasz will investigate whether or not a new allocator can be linked
   with the client instead of using a preload mechanism.
 * Dirk will follow up to make sure that jemalloc and tcmalloc libraries are
   available in CERN's cvmfs.

### Release 4.0.0 ###
We are tentatively targeting a release candidate no later than the middle of
January 2014. Prior to that time we are considering making a preview RPM
available via the xrootd.org site. The preview RPM may have features added
to it prior to actual release candidate availability.

This is a major change in the XRootD package and is not binary compatible with
previous releases. This isn't a problem client-side but plug-in writers will
need to recompile server-side.

Because of backward compatibility issues we are constrained how we release the
package via EPEL. Currently, our plan is to release the package as xrootd4
(as opposed to xrootd) and only rename the package back to its original name
in EPEL 7 which, in itself, is a non-backward compatible release. Some major
changes people will see (though, in fact, transparent) are:

 * The new XRootD client replaces the old client (the old client will be
   supported until 2016).
 * The Posix interface and xrdcp will switch to using the new client.
 * Root’s TXNetFile will switch to using the new client.
 * Full IPV6 support.

#### Action Items Related To 4.0.0 ####
 * Gerri will default loading the new TXNetFile (in compatibility mode) for ROOT
   5.34.12 slated for the end of November 2013.
 * Andy will follow up with Brian Bockelman (again) to see if the Throttle
   library can be included.
 * Andy will follow up with Matevz Tadel to find out the state of the caching
   proxy server relative to release 4.0.0.
 * Dirk will follow up with Markus to see if the http plug-in can be either
   included in the XRootD base package or as an RPM install available via the
   xrootd.org site.

### Do You Need To Upgrade? ###
That was the question posed by Doug Benjamin. In fact, he pointed out that it is
very difficult for an administrator to decide. Our solution to this issue is to
place a link next to each release on xrootd.org labeled something like
"Upgrade?" which will point to a page describing the changes that may be of
interest in various categories (e.g. performance, federation, etc.). Andy will
be responsible for creating the page after Lukasz sends him the release notes
for a particular release. So, there may be a couple of days delay between the
release being posted and the upgrade page being available.

### Miscellaneous Action Items ###
 * Gerri will follow up with Marko Cattaneo about Valgrind issues with respect
   to gsi authentication.
 * Gerri will allow CGI information to be passed to the security plugins to
   specify an alternate location for the certificate file (gsi) or the ticket
   file (krb5).
 * Fons will register xroot as an official protocol equivalent to root protocol
   in the Root vector table.
 * Fons will add the special redirect error and GetNewURL() method to the Root
   file plug-in interface for the November preview release of ROOT 6.
