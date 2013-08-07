# symlinked from local_manifest repo
# Run from root of source tree

FILTER=$1

root=`pwd`
cd $root

# In order to use pstest must be in build environment
. build/envsetup.sh >/dev/null 2>&1


