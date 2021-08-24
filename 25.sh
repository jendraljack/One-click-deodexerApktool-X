#!/system/bin/sh
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/apktool/lix
#in some targets,LD_PRELOAD will cause a error.
export LD_PRELOAD=
export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/apktool/dex2jar/lib:/data/data/per.pqy.apktool/apktool/openjdk/lib:/data/data/per.pqy.apktool/apktool/openjdk/lib/arm:/data/data/per.pqy.apktool/apktool/openjdk/lib/arm/jli:/data/data/per.pqy.apktool/apktool/openjdk/lib/arm/server:$LD_LIBRARY_PATH
#umask 000
bb="/data/local/busybox"
raj="$($bb dirname $0)"
maindir="$($bb dirname "$@")"
echo "masuk $maindir"
echo "oat2dex for above 23 sdk"
##########
/data/data/per.pqy.apktool/apktool/openjdk/bin/java -Xmx1024m -jar $raj/oat2dex-0.88.jar -o $maindir/de-odex $maindir /system/framework/arm
cd $maindir
$bb mv -f $maindir/de-odex/*.dex ../
#/data/data/per.pqy.apktool/apktool/openjdk/bin/java -Xmx1024m -jar /data/data/per.pqy.apktool/apktool/dex2jar/lib/oat2dex-0.87.jar $1 dex
