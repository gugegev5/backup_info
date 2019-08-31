##[zsh oh-my-zsh](https://www.jianshu.com/p/27c8088dc8f7)   
##agnoster [solarized](https://ethanschoonover.com/solarized/) powerline font   
##nodejs   
##[nginx](http://nginx.org/en/docs/beginners_guide.html)   


mkdir /app
mkdir /app/software
mkdir /download

##zsh
yum -y update && yum -y install zsh git
chsh -s $(which zsh)
cd /download
git clone https://github.com/powerline/fonts.git --depth=1
cd /download/fonts
./install.sh
cd /
rm -rf /download/fonts
echo "y" >> sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

##node
yum -y install gcc gcc-c++ kernel-devel
cd /download
wget https://npm.taobao.org/mirrors/node/v12.9.1/node-v12.9.1.tar.gz
tar zxvf node-v12.9.1.tar.gz -C /app/software/
cd /app/software/node-v12.9.1
./configure
make
make install
echo "export NODE_HOME=/app/software/node-v12.9.1"  >> /etc/profile
echo "export PATH=$NODE_HOME/bin:$PATH"  >> /etc/profile
source /etc/profile

##nginx
yum -y install make zlib zlib-devel gcc gcc-c++ libtool  openssl openssl-devel
cd /download
wget https://ftp.pcre.org/pub/pcre/pcre2-10.33.tar.gz
tar zxvf pcre2-10.33.tar.gz -C /app/software/
cd /app/software/pcre2-10.33
./configure
make && make install
cd /download
wget http://nginx.org/download/nginx-1.16.1.tar.gz
tar zxvf nginx-1.16.1.tar.gz -C /app/
cd /app/nginx-1.16.1
./configure --with-http_ssl_module --with-pcre=/app/software/pcre2-10.33
make
make install
/usr/local/nginx/sbin/nginx -v