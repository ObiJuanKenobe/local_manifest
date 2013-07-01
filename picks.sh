# symlinked from local_manifest repo
# Run from root of source tree

root=`pwd`
cd $root

# In order to use pstest must be in build environment
. build/envsetup.sh >/dev/null 2>&1

cd build
pstest 7717/2
cd $root

# ------------------------------#
# Device changes
# ------------------------------#

cd device/samsung/jf-common
git fetch http://review.cyanogenmod.org/CyanogenMod/android_device_samsung_jf-common refs/changes/91/44691/5 && git cherry-pick FETCH_HEAD
cd $root

# ------------------------------#
# Picks for all
# ------------------------------#

cd frameworks/base
pstest 5133/3
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_base refs/changes/80/44580/9 && git cherry-pick FETCH_HEAD
cd $root

cd hardware/libhardware
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_libhardware refs/changes/83/44783/4 && git cherry-pick FETCH_HEAD
cd $root

cd packages/apps/ROMControl
pstest 9142/16
pstest 9132/5
cd $root

cd vendor/aokp
pstest 8943/1
cd $root

cd vendor/samsung
pstest 9220/2
pstest 9223/1
cd $root

# Reinitialize build environment with pspush
. build/envsetup.sh >/dev/null 2>&1
