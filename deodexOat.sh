#!/system/bin/sh
deodexoat="$(dirname $0)"
kds="$(getprop ro.build.version.sdk)"
echo "$kds" > $deodexoat/mysdk_$kds
echo "Your sdk: $kds then $deodexoat/$kds.sh will be execute."
find $deodexoat -name "*.oat" -exec sh $deodexoat/$kds.sh {} \;
echo "Deodex oat OK"
