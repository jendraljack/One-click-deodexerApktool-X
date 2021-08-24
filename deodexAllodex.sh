#!/system/bin/sh
chmod 0755 /data/local/busybox
deodexalldir="$(busybox dirname $0)"
echo "LB deodexer..."
if [ ! -d $deodexalldir/system ]
then
mkdir -vp -m 0755 $deodexalldir/system/app
mkdir -m 0755 $deodexalldir/system/framework
mkdir -m 0755 $deodexalldir/system/priv-app
echo "make folder ok."
fi
cd $deodexalldir/system
echo "Starting copy odex to $deodexalldir/system"
cp -rf /system/app/*/*.apk ./app
cp -rf /system/app/*/oat/arm/*.odex ./app
cp -rf /system/framework/oat/arm/*.odex ./framework
cp -rf /system/framework/*.jar ./framework
cp -rf /system/framework/arm ./framework/arm
cp -rf /system/priv-app/*/*.apk ./priv-app
cp -rf /system/priv-app/*/oat/arm/*.odex ./priv-app

find $deodexalldir -name "*.odex" -exec sh $deodexalldir/deodexerApp.sh {} \;
echo "Ok"
