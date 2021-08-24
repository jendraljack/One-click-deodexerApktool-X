 #!/system/bin/sh

makefolder="$(dirname $0)"

######

find $makefolder -name "*.apk" > $makefolder/list.sh

busybox sed -i 's|.apk||g' $makefolder/list.sh

cat $makefolder/list.sh|busybox awk '{print "mkdir \""$0"\""}'|sh

cat $makefolder/list.sh|busybox awk '{print "cd "$0"\nmv ../\"$(basename "$0").apk\""" ./"}' > /data/local/make.sh

#find $makefolder -type d -exec sh $makefolder/masukanapk.sh {} \;

echo "Selesai" 
