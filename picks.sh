# symlinked from local_manifest repo
# Run from root of source tree

FILTER=$1

root=`pwd`
cd $root

# In order to use pstest must be in build environment
. build/envsetup.sh >/dev/null 2>&1

cd build
pstest 7717/2
cd $root

if [ "$FILTER" = "" ]; then

# ------------------------------#
# Device changes
# ------------------------------#

cd device/samsung/jf-common
pstest 9354/1
cd $root

# ------------------------------#
# Picks for all
# ------------------------------#

cd frameworks/base
pstest 5133/3
pstest 9282/1
pstest 9301/1
pstest 7600/3
cd $root

cd hardware/libhardware
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_libhardware refs/changes/83/44783/4 && git cherry-pick FETCH_HEAD
cd $root

cd packages/apps/Camera
pstest 9328/8
cd $root

cd packages/apps/Mms
psest 9291/1
cd $root

cd packages/apps/ROMControl
pstest 9142/16
# soft key RC side has FC
#pstest 7601/3
cd $root

cd packages/apps/Settings
pstest 9367/4
cd $root

cd vendor/aokp
pstest 8943/1
pstest 9378/1
cd $root

fi

if [ "$FILTER" = "exfat" ]; then
#### EXFAT START ####
cd external/e2fsprogs
pstest 9343/1
cd $root

cd system/vold
pstest 9346/1
pstest 9347/1
cd $root

cd vendor/aokp
pstest 9349/1
cd $root
#### EXFAT END ####
fi

if [ "$FILTER" = "privacy" ]; then
#### PRIVACY GUARD START #####
cd frameworks/base
pstest 9278/2
pstest 9279/1
cd $root

cd packages/apps/Browser
pstest 9275/1
cd $root

cd packages/apps/Settings
pstest 9274/3
pstest 9281/2
pstest 9283/2
cd $root

cd packages/providers/CalendarProvider
pstest 9290/1
cd $root

cd packages/providers/ContactsProvider
pstest 9277/1
cd $root

cd packages/providers/TelephonyProvider
pstest 9276/1
cd $root

#### PRIVACY GUARD END ####
fi



# Reinitialize build environment with pspush
. build/envsetup.sh >/dev/null 2>&1
