---
layout: default
title:  Collaboration Meeting Minutes (24-October-2012)
---

XRootD Collaboration Meeting held at CERN 24-October-2012
---------------------------------------------------------

Attendees:
 * Dirk Duellmann (CERN)
 * Gerardo Ganis (CERN)
 * Andrew Hanushevsky (SLAC)
 * Lukasz Janyst (CERN)
 * Danila Oleynik (JINR)
 * Andreas Peters (CERN)
 * Justin Salmon (CERN)

Discussion Topics
-----------------

### Releases ###

We are now 3.2.5 next 3.2.6 rc-1 patch release is schedule for Wednesday,
October 31st.  All patch submitters must supply their list of patches that
should be included in 3.2.6 prior to this time. There is still one
outstanding patch (Certificate Cache Serialization) that is still in
testing but should be available prior to this date. Fortunately, all of
them for this cycle were at this meeting.

Relative to the root release, root 5.34.02 (currently out) and subsequent
patch releases will still use the old client. Root 6.0.0 candidate release
will be out 10/30 with a production release scheduled for 12/2. This
happily coincides with the XRootD 3.3.0 release schedule.

### Next minor release ###

The next minor release will be 3.3.0. There are approximately 700 patches
outstanding for this release (about 450 related to the new client). The
release candidate, 3.3.0-rc1 is scheduled for Friday, November 2nd. The new
client will be available as code in development in this release. Generally,
everything that is in git head will be in this release. Production release is
scheduled for December 2nd.

The three most significant user changes in 3.3.0 are:

 * xrdcpy will be renamed to xrdcp with xrdcp becoming xrdcpold. The new
   xrdcp adopts the backwards compatible but a more user-friendly command
   line interface that is used by all subsequent versions of xrdcp.
 * Third-party copy support as the new xrdcp interface includes that.
 * The XRootD protocol will be available as a plug-in shared library that
   can be used by xproofd allowing the root team to retire the rootd daemon.

### Next major release ###

The next major release, 4.0.0 is scheduled for the first part of March, 2013.
It will minimally include:

 * Full production version of the new client,
 * xrdcopy (new client) will replace xrdcp
 * XrdPosix will use the new client (this means that the proxy server and
   FUSE will use the new client)
 * IPV6 (will require plug-in writers to recompile their code)
 * The readv pass-through enhancement supplied by CMS

Some significant user changes are:

 * The xrdfs command replaces the xrd command to provide full access to XRootD
   features using the new client. The new interface is much more user-friendly.
 * The new client-based xrdcopy replaces xrdcp but the interface does not
   change,
 * While the new client can co-exist with the old client, the new client will
   become the default for the root plug-in. However, the old client can be
   selected by either an envar setting or a root.rc directive.
 * The two year support life-time clock for the old client starts ticking.

### EPEL conformance ###

Generally, all EPEL related concerns have been addressed for DPM, ROOT, EOS,
and CMS. We now have a list of publicly supported API and a support statement
on how those API will be treated across releases. This has been tentatively
approved by EPEL This, we can be in compliance starting at release 3.3.0.

**Action Item:** LJ will touch bases with Doug Strain (OSG) on 3.3.0 for EPEL
compliance and keep in touch with Mattias Ellert (the EPEL coordinator) to make
sure we are on track.

### The git repository ###

The new client is in github. However, the repositories will be merged
for 3.3.0 but ABI compatibility will not be guaranteed for the new client
until 4.0.0. The collaboration expressed passive interest (most neutral and 3
positive) to moving the repository to github. The positives are that better
tools are available in github and that the project will receive more
visibility. The move will occur {+|-} two weeks around 4.0.0.

**Action Item:** LJ will research the security implications of shared
access (i.e. controlling writes) in github.

### Automated testing ###

Justin Salmon finished the automatic development framework and developed
some functionality tests which include:

 * GSI, Kerberos, frm, meta-manager
 * Automatic cluster instantiations
 * Copy back/forth, stats
 * Fuse test for meta operations

Additional tests are needed, especially in testing performance retrogression.
Some tests came from Doug Strain (OSG). In fact, we will encourage OSG
involvement with the anticipation that they will adopt the automated test
framework. In any case, we need more test programs from participants.

**Action Item:** ABH will ask Wei Yang and Doug Benjamin for test programs

**Action Item:** ABH will add Justin to xrootd-dev and obtains a SLAC account
for him.

### Software development for 6 months ###

While the following list seems short, given all the activity in producing
the 4.0.0 release it should come as no surprise. So far we have:

* Parallel writes in new client.
* Third party copy using a delegated proxy certificate.
