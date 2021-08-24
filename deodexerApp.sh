#!/system/bin/sh
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/apktool/lix
#in some targets,LD_PRELOAD will cause a error.
export LD_PRELOAD=
export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/apktool/dex2jar/lib:/data/data/per.pqy.apktool/apktool/openjdk/lib:/data/data/per.pqy.apktool/apktool/openjdk/lib/arm:/data/data/per.pqy.apktool/apktool/openjdk/lib/arm/jli:/data/data/per.pqy.apktool/apktool/openjdk/lib/arm/server:$LD_LIBRARY_PATH
#umask 000
chmod 0755  /data/local/busybox
bb="/data/local/busybox"
fw="$($bb dirname $0)"
utama="$($bb dirname "$@")"
odex="$($bb basename "$@")"
bcp="$($bb find $fw -name 'boot.oat')"
bcpdir="$($bb dirname $bcp)"
echo "Akan Deodex $@ pada: $utama"
echo "Boot-classpath: $bcpdir"
##########
/data/data/per.pqy.apktool/apktool/openjdk/bin/java -Xmx1024m -jar $fw/oat2dex-0.88.jar -o $utama/de-odex "$@" $bcpdir
$bb mv -f $utama/de-odex/*.dex $utama
$bb rm -f "$@"
#/data/data/per.pqy.apktool/apktool/openjdk/bin/java -Xmx1024m -jar /data/data/per.pqy.apktool/apktool/dex2jar/lib/oat2dex-0.88.jar $1 dex 
