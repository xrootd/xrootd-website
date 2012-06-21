---
layout: default
title:  Release Management Meeting Minutes (15-June-2012)
---

Release Management Meeting 15-June-2012
---------------------------------------

Attendees:
 * Gerri Ganis (CERN)
 * Andrew Hanushevsky (SLAC)
 * Lukasz Janyst (CERN)

We discussed the release schedule for the next 9 months or so. The summary
of the discussion:

 * Patch release 3.2.2 is scheduled to be available by June-20-2012.
 * Minor release 3.3.0 should be available by September-5-2012. Hoever,
   given the number of meetings scheduled for September, it may slip to
   the end of the month. Included in this release:

    * Refactoring of shared libraries and include files for full EPEL
      compatability. Plugin writers should see no operational changes.
      However, not all include files will be available. Specifically,
      we will now only install include files required for public interfaces
      and commonly utility classes.
    * Changes to all source file to indicate that the code is now available
      under the GNU Lesser General Public License (LGPL). See
      [http://www.gnu.org/licenses/]([http://www.gnu.org/licenses/) for details.
    * Internal version checking run-time subsystem. This subsystem checks that
      all plug-ins as well as cross library linkages are compatible with each
      other. Any attempt to use incompatible code will cause the program to
      issue a warning, advise which version should have been used to compile
      the code, and exit.
    * The new xroot client will become available in beta form. The new client
       includes numerous performance and stability enhancements.

 * Major release 4.0.0 should be available by March-1-2013. This release will
   require that all plugin writers recompile their code. This version will
   minimally include full IPV6 support. Because network addresses are, in many
   cases, passed across plugin interfaces a recompilation provides the
   opportunity to verify that plugins are able to accept IPV6 addresses. Our
   current stand is to replace the use of sockaddr with a new class,
   XrdNetAddr, that provides format independent information about an IP
   address. Plugin writers that wish to make minimal modifications to their
   code can use the following code:

   Originally:

       extern "C" myplugin( ..., ..., sockaddr *sockP, ..., ... )
                 { plugin body }

   Relese 4.0.0:

       extern "C" myplugin( ..., ..., XrdNetAddr *netaP, ..., ... )                                               
               {struct sockaddr *sockP = netaP->Sockaddr();
                plugin body
               }

   On the other hand, we expect plugin writers to fully exploit the features
   of XrdNetAddr as it provides a format independent way of handling all
   types of network addresses.

 * We have revised the code release schedule to be more practical. Release
   rules are:

    * Patch releases will be released as soon as demand requires. We do not
      expect this to be more frequent than once a month and typically
      quarterly.
    * Minor releases (i.e., those where the middle digit changes) will be
      released no more than every four months and typically only twice a year.
      Target dates are March, optionally in June, and one in October.
    * We have not decided on the schedule of major releases (i.e., those where
      the first digit changes) but will likely be no more frequent every two years.

 * We now have formulated a policy on binary compatibility. The policy is:

    * We guarantee that all public class interfaces are binary compatible
      for patch as well as minor releases.
    * Public interfaces are defined as those interfaces for which we have
      installed include files in "/usr/include/xrootd" and whose implementation
      is located in "libXrdUtils.so".
    * The shared library implementing public interfaces will not change
      versions across minor and patch releases to allow plug-ins to function
      without re-linking or re-compilation. Version information for other
      libraries may change across minor releases.
    * Use of classes not considered public is discouraged and we will make
      no attempt to keep binary compatibility for those classes. However, we
      will make a best effort to indicate when we have broken compatibility
      in the release notes.
