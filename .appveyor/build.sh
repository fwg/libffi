#!/bin/sh

CPPFLAGS="-DFFI_BUILDING_DLL"

if [ "$BUILD_SHARED" = "no" ]; then
  CPPFLAGS="-DFFI_BUILDING"
fi

./configure --build=$BUILD --host=$HOST \
  --enable-shared=$BUILD_SHARED --enable-static=yes \
  CC='/cygdrive/c/projects/libffi/msvcc.sh -m64' \
  CXX='/cygdrive/c/projects/libffi/msvcc.sh -m64' \
  LD='link' CPP='cl -nologo -EP' CXXCPP='cl -nologo -EP' \
  CPPFLAGS="$CPPFLAGS" \
  AR='/cygdrive/c/projects/libffi/.travis/ar-lib lib' \
  NM='dumpbin -symbols' STRIP=':'

cp src/x86/ffitarget.h include
make
result=$?
find .

exit $result