# Run from root of source tree

root=`pwd`
cd $root

# In order to use pstest must be in build environment
. build/envsetup.sh >/dev/null 2>&1

cd build
pstest 7717/2
cd $root

cd device/samsung/msm8960-common
pstest 8924/2
cd $root

. build/envsetup.sh >/dev/null 2>&1
