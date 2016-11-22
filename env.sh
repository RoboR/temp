# @file         env.sh
# @copyright    Copyright(c) Dyson Technology Ltd 2016. All rights reserved.
# @brief        Environment variables used by the Xtensa toolchain and Qualcomm SDK.

export ROOT_PREFIX=
export XTENSA_INST=
case `uname -o` in
    Linux) os=linux ;;
    GNU/Linux)
	os=linux;
	SDK_ROOT=/opt/Qualcomm/qca4010-tx-1-2_qca_oem_ext.git/target;
	XTENSA_INST=/opt/Qualcomm;
	;;
    Msys) os=win32 ;;
    Cygwin)
	os=win32;
	ROOT_PREFIX=/cygdrive/c;
	SDK_ROOT="C:/Apps/Qualcomm/qca4010-tx-1-2_qca_oem_ext.git/target";
	mount -f C:/cygwin64 /cygwin64;
	mount -f C:/Users /Users;
	XTENSA_INST=C:/Apps/xtensa;
        XTENSA_INST_FOR_PATH=`cygpath "$XTENSA_INST"`;
	;;
    *) echo "Unrecognised or unsupported host operating system." ;;
esac
XTENSA_INST_FOR_PATH="${XTENSA_INST_FOR_PATH:-$XTENSA_INST}"
RE=RE-2013.3-$os
export XTENSA_CORE=KF
export XTENSA_ROOT="$XTENSA_INST"/XtDevTools/install/builds/${RE}/KF
export XTENSA_SYSTEM="$XTENSA_ROOT"/config
export XTENSA_TOOLS_ROOT="$XTENSA_INST"/XtDevTools/install/tools/${RE}/XtensaTools
export LM_LICENSE_FILE="$XTENSA_INST"/xtensa-licence.dat
# Why need users to set path in environment, surely this is safer
# TODO: check if global PATH setting is required for GUI tools (Xplorer)
PATH="$PATH:$XTENSA_INST_FOR_PATH/XtDevTools/install/tools/${RE}/XtensaTools/bin"

if [ -n "$SDK_ROOT" ]
then
    source "$SDK_ROOT/sdkenv.sh"
else
    echo "Please set SDK_ROOT to point to your qca4010-tx-.../target directory."
fi
