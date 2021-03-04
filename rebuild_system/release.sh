sed -i 's/set \$release .*;/set \$release '$1';/g' /usr/local/nginx/conf/nginx.conf
sed -i 's/renpan-page\/.\..\..\/index.html/renpan-page\/'$1'\/index.html/g' /usr/local/nginx/conf/nginx.conf
