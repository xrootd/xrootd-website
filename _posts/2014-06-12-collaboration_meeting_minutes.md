---
layout: default
title:  Collaboration Meeting Minutes
---

XRootD Collaboration Meeting held at CERN 12-June-2014
---------------------------------------------------------

Attendees:
 * Dirk Duellmann (CERN)
 * Andrew Hanushevsky (SLAC)
 * Lukasz Janyst (CERN)
 * Alja Mrak-Tadel (UCSD)
 * Andreas Peters (CERN)
 * Matevz Tadel (UCSD)

Discussion Topics
-----------------

### Release 4.0.1 ###

This is the first bug-fix release for Release 4. We are planning on issuing
a bug fix in 3 to 4 weeks. As of now only two minor bugs have been found and
both have bypasses.

### Release 4.1.0 ###

This is the next feature release for Release 4. It will include:

 * full-featured IPv6/IPv4 handling (the current release assumes dual-stacked
   hosts)
 * parallel 3rd party copy
 * caching proxy service enhancements (e.g. delayed client
   instantiation and enhanced purging policies).

It is scheduled for September.

### EOS in EPEL ###

This requires supplying public header versions of the private headers used by
EOS. We plan to use a wrapping technique that essentially hides the private
implementation so that we are not boxed in regarding changing ostensibly
private code. This may be included in 4.1.0, or earlier, depending on the
EOS schedule.

### The xrootd.org Domain Name ###

The domain name registration and DNS entry ownership will switch from Dirk to
Andrew.

### XRoorD Workshop ###

We are tentatively planning to hold a three day workshop in San Diego the second
or third week of January, 2015. The focus of the workshop is to teach people
about XRootD features, why you would use a particular feature, how to configure
and deploy the feature, tuning options, debugging deployment issues. For any
particular feature a person should have the capability to do a full deployment.
The initial list we came up with includes:

 * Cluster & Server configurations (standard and proxy)
 * Caching Proxy deployment
 * Client plugin and tuning options
 * Deploying IPv6
 * Handling public/private network setups
 * EOS deployment
 * Monitoring Collector deployment
 * Using monitoring data to discover site issues
 * Enabling and using remote debugging facilities
