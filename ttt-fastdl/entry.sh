wget "https://csgottt.com/downloads/TTT.Linux.latest.${TTT_VERSION}.zip"
unzip -n TTT.Linux.latest.${TTT_VERSION}.zip
cd build-linux
cp -r * /usr/local/apache2/htdocs/ttt/
cd ..
rm -r ./build-linux
rm -r TTT.Linux.latest.${TTT_VERSION}.zip
httpd-foreground
