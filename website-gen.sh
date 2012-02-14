#!/bin/bash
#-------------------------------------------------------------------------------
# Generate the xrootd website code from git repo
# Author: Lukasz Janyst <ljanyst@cern.ch>
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Some variables
#-------------------------------------------------------------------------------
RUBYPATH=/afs/slac.stanford.edu/www/projects/scalla/vol1/website-gen/ruby-1.9.2
GEMSPATH=/afs/slac.stanford.edu/www/projects/scalla/vol1/website-gen/gems
GEMSREPO=/afs/slac.stanford.edu/www/projects/scalla/vol1/website-gen/gems-repo
REPOPATH=/afs/slac.stanford.edu/www/projects/scalla/repo/xrootd-website.git
WEBSITEDIR=/afs/slac.stanford.edu/www/projects/scalla

#-------------------------------------------------------------------------------
# Set up the paths
#-------------------------------------------------------------------------------
export PATH=$RUBYPATH/bin:$GEMSPATH/bin:$GEMSREPO/bin:$PATH
export LD_LIBRARY_PATH=$RUBYPATH/lib:$LD_LIBRARY_PATH
export GEM_HOME=$GEMSREPO

#-------------------------------------------------------------------------------
# Check if we have all the necessary components
#-------------------------------------------------------------------------------
function findProg()
{
  for prog in $@; do
    if test -x "`which $prog 2>/dev/null`"; then
      echo $prog
      break
    fi
  done
}

if test x`findProg git` = x; then
  echo "[!] Unable to find git, aborting..." 1>&2
  exit 1
fi

if test x`findProg jekyll` = x; then
  echo "[!] Unable to find jekyll, aborting..." 1>&2
  exit 1
fi

#-------------------------------------------------------------------------------
# Checkout the repository, compile the website, and copy the result
#-------------------------------------------------------------------------------
# exit on any error
set -e

TEMPDIR=`mktemp -d /tmp/xrootd-website.XXXXXXXXXX`

echo "[i] Working in: $TEMPDIR" 1>&2
echo "[i] Checking out the repository..."

git clone $REPOPATH $TEMPDIR >/dev/null

echo "[i] Compiling the web site..."

(
  cd $TEMPDIR
  jekyll
)

echo "[i] Copying the web site to the destination directory"
cp -fru $TEMPDIR/_site/* $WEBSITEDIR
