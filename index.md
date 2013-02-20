---
layout: default
title:  Home Page
tab:    home
---

Welcome to the XRootD webpage
-----------------------------

The XROOTD project aims at giving high performance, scalable fault tolerant
access to data repositories of many kinds. The typical usage is to give
access to file-based ones. It is based on a scalable architecture, a
communication protocol, and a set of plugins and tools based on those. The
freedom to configure it and to make it scale (for size and performance)
allows the deployment of data access clusters of virtually any size, which
can include sophisticated features, like authentication/authorization,
integrations with other systems, WAN data distribution, etc.

XRootD software framework is a fully generic suite for fast, low latency
and scalable data access, which can serve natively any kind of data,
organized as a hierarchical filesystem-like namespace, based on the concept
of directory. As a general rule, particular emphasis has been put in the
quality of the core software parts.

Quick Links
-----------
 * [savannah](https://savannah.cern.ch/bugs/?group=xrootd) - report and track
   bugs
 * [Scalla-Intro.pdf](/papers/Scalla-Intro.pdf) - an overview of the xrootd
   system
 * {{ "" | latest_release_url }} - the latest version of the software
 * [Release Notes](/download/ReleaseNotes.html) - a list of significant changes
   between the releases
 * [cgit](http://xrootd.cern.ch/repos/xrootd.git) - repository browser

News
----

\[[RSS](/rss.xml)\]

<ul>
{% for post in site.posts %}
 <li> <span class="post_date">[{{ post.date | date_to_string }}]</span> <a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
