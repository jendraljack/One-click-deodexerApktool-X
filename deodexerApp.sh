#!/system/bin/sh
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/apktool/lix
#in some targets,LD_PRELOAD will cause a error.
export LD_PRELOAD=
export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/apktool/dex2jar/lib:/data/data/per.pqy.apktool/apktool/openjdk/lib:/data/data/per.pqy.apktool/apktool/openjdk/lib/arm:/data/data/per.pqy.apktool/apktool/openjdk/lib/arm/jli:/data/data/per.pqy.apktool/apktool/openjdk/lib/arm/server:$LD_LIBRARY_PATH
#umask 000
fw="$(busybox dirname $0)"
utama="$(busybox dirname "$@")"
odex="$(busybox basename "$@")"
echo "Akan Deodex $@ pada: $utama"
echo "Bootclasspath: $fw/system/framework/arm"
##########
/data/data/per.pqy.apktool/apktool/openjdk/bin/java -Xmx1024m -jar $fw/oat2dex-0.88.jar -o $utama/de-odex "$@" $fw/system/framework/arm

#/data/data/per.pqy.apktool/apktool/openjdk/bin/java -Xmx1024m -jar /data/data/per.pqy.apktool/apktool/dex2jar/lib/oat2dex-0.88.jar $1 dex
