---
layout: default
title:  Collaboration Meeting Minutes (14-March-2012)
---

XRootD Collaboration Meeting held at CERN 14-March-2012
-------------------------------------------------------

Attendees:
 * Doug Benjamin (Duke)
 * Dirk Duellmann (CERN)
 * Gerardo Ganis (CERN)
 * Andrew Hanushevsky (SLAC)
 * Lukasz Janyst (CERN)
 * Danila Oleynik (JINR)
 * Andreas Peters (CERN)
 * Artem Petrosyan (JINR)

Discussion Topics (No particular Order)
---------------------------------------

### New Client status ###

 * Mostly done but some functions are not yet implemented, more work on proper
   timeout handling is needed and the client relies on the use of root’s TTree
   Cache.

 * We discussed some pressing requirements desired by all of the experiments,
   especially in a federated environment. We decided that the priory would be:

   - Timeouts for single source reads with a switch to another server
     (about 3 months) and
   - Multi-source random reads with single source timeouts driving it
     (about 6 months).

 * There was a lot of discussion on how to transition to the new client.
   Specifically, just give people a deadline to move, support the old
   client indefinitely (only serious bugs fixed), provide an old-style
   client wrapper to the new client.

 * There was some agreement but no consensus. It’s still not clear how
   difficult it would be to devise an old wrapper for the new client to
   ease transition. With no wrapper, we would set a 2 year timeline to
   switch to the new client when it is released. We would likely support
   the old client for two years after that with no upgrades and only
   fault conditions fixed. Everyone thought this was reasonable but yet
   fully flushed out to commit to this scenario.

### xrdcp ###

 * As part of the move to the new client, the front-end to xrdcp is completely
   revised in a way that can be used by the old client and the new one. This
   provides the identical user interface regardless of which client is being
   used (deemed a requirement).

 * Creating a new interface that uses common interface standards proved to be
   challenging as the old interface used some esoteric conventions. The
   solution was to support the esoteric as legacy options but otherwise just
   document the “standard” option list.

 * One conflict arose that was not clear how to fix and that was use of
   the -force option to allow the client to try the copy for about a week
   before giving up. We decided it wasn’t worth keeping but we should check.

 * **Action Item:** AH will e-mail Costin about whether the -force is still
   needed.

### Versioning ###

 * Once we switched to using shared libraries, corresponding to EPEL guideline,
   people not using RPMS have had problems mixing and matching executables with
   the correct library versions.

 * We decided that the real problem was that we didn’t have a fool-proof
   mechanism to determine when a shared library evolves in a binary
   incompatible way.

 * **Action Item:** LJ will bump the so name for every master release.
   No binary incompatible changes will be accepted to patch releases.

### Git hub ###

 * There was a long discussion of whether to move the project repository
   from SLAC to GitHub. It would raise visibility but that brings its own
   set of issues.  The new client is already there. We decided to continue
   internal discussions at each of our respective sites to determine the ups
   and downs of such a move.

### Monitoring ###

 * Discussion of how work would be split between JINR and UCSD. The approach
   is that, by large, JINR will focus on summary monitoring with some detail
   traffic included (e.g. file copy records). UCSD would concentrate on
   detailed monitoring.

 * There is some overlap and it’s not clear how we handle that. Specifically,
   we need plug-ins for rending agents (i.e., ganglia, Mona Lisa, etc) and
   plug-ins for monitoring record storage (i.e., Cassandra, root, etc).
   What was recognized is that for this to work smoothly, a common record
   format must be developed for each set of plug-ins.

 * **Action Item:** AH will ask Ian Bird for standard monitoring record format
   document circulating in the WLCG. As we are moving in the direction discussed
   at the Lyon Federation Workshop, it would be good to use the format if
   possible.

### Third Party Copy Status ###

 * The server-side of 3rd party copy works and we need xrdcp to provide the
   correct cgi information to trigger the copy. This is tied up with the new
   xrdcp front-end (see above). It should be done within a month.

 * The interface is http friendly so it can be carried forward to http servers
   as well.

 * While there was a lot on interest from Atlas and CMS, that has waned with
   only Alice and CMS/Castor expressing great interest. So, we move forward.

### Licensing ###

 * We decided that we would move our license to an LGPL model on the next
   release, subject to the action items below.

 * **Action Item:** LJ will provide the license text (done).
 * **Action Item:** AH will consult with SLAC lawyers to get this moving to
   completion.

### Logging ###

 * This issue surfaced once again, triggered by RAL’s interest in deploying
   xrootd for a large project. We decided to address the concerns by:

 * **Action Item:** AH will put in support for the logrotate command for
   sites wishing to use this mechanism as opposed to the native mechanism.

 * **Action Item:** AH will factor in the desire to have machine parse able
   logs vs. human readable logs. This is always a problem with tensions
   between large sites and small sites. It may be possible to include key-value
   information as an option. This is clearly tied into the larger project of
   redoing log messaging.

### RPM’s in Epel & OSG ###

 * We’ve always had historical tensions on where and how distributes RPM’s.
   Some rely on the EPEL repository while others on the OSG repository which
   is identical to the official RPM’s are hosted at SLAC.

 * To make things go smoother, LJ got the appropriate accounts to create fedora
   builds and make RPM’s compatible with EPEL. This should be done in 2-3 weeks.
   This will likely remove OSG out of the loop. However, OSG does the DSI plug-in
   packaging. So, this may be a stumbling block.

 * **Action Item:** LJ should become EPEL package co-owner to speed package
   deployment.

 * **Action Item:** AP will provide the DSI plug-in for RH6 (OSG does not) and
   as a separate RPM. This will provide a smooth transition.

### Python vs Perl ###

 * Recently, a user got an unsupported Python binding to the xrootd API and
   implemented site critical services with it (never mind that was bad form).
   In the latest release, that binding no longer works because we moved some
   API’s to different libraries to solve other problems. Now, we are getting
   requests to resolve this problem. We have a Perl binding and feel that we
   cannot continue to support both. The group preferred the Python bindings.

 * **Action Item:** AH will mail to xrootd-l asking which one we should
   support. Ask who uses what and indicate we can only support one.

### IPV6 ###

 * While we see the world moving to IPV6 we see that movement so slow that
   this appears to not be a critical issue at this time. However, we decided
   to start putting in the basic blocks to make a smooth transition.

 * **Action Item:** AH will create a new IPV4/6 XrdNetAddress class and
   integrate it in the current code (it’s a significant effort). This will
   provide a firm foundation for LJ to do the development. Our time-line for
   full IPV6 support is 3Q 2013.

### Simple Example Configurations ###

 * Many people have requested simplified templates for configuration files
   dealing with a simple site.

 * **Action Item:** DB will head this up.

### Xrootd Protocol Plugin ###

 * GG requested that an so version of the xrootd protocol be created so that
   he could use it as a plug-in. We agreed that we would build an so version
   of the protocol as this is pretty trivial to do.

### Miscellaneous ###

 * **Action Item:** LJ will create an automatic monthly telecom reminder e-mail.
   We will have a telecom only if there something we need to discuss as a group.

### Next Meeting ###

 * Next collaboration meeting will be held at CERN during the week of June
   11th (in conjunction with Atlas software week). LJ will get a phone bridge
   going so other can remotely attend.
