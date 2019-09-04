#! /bin/bash
# Tool Chain: Adjust Tool Chain
# Edit as mlfs

#mv -v /tools/bin/{ld,ld-old}
#mv -v /tools/$(${MLFS_TARGET}-gcc -dumpmachine)/bin/{ld,ld-old}
#mv -v /tools/bin/{ld-new,ld}
#ln -sv /tools/bin/ld /tools/$(${MLFS_TARGET}-gcc -dumpmachine)/bin/ld

#SPECFILE=`dirname $(${MLFS_TARGET}-gcc -print-libgcc-file-name)`/specs &&
#${MLFS_TARGET}-gcc -dumpspecs > tempspecfile
# check file for no instaces of "/lib/ld-musl-x86_64.so.1" .. should be "/tools/lib/ld-musl-x86_64.so.1"
#mv -vf tempspecfile $SPECFILE &&
#unset SPECFILE

GCC_INCLUDEDIR=`dirname $(${MLFS_TARGET}-gcc -print-libgcc-file-name)`/include &&
find ${GCC_INCLUDEDIR}/* -maxdepth 0 -xtype d -exec rm -rvf '{}' \; &&
rm -vf `grep -l "DO NOT EDIT THIS FILE" ${GCC_INCLUDEDIR}/*` &&
unset GCC_INCLUDEDIR