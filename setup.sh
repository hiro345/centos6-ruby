#! /bin/sh
epelRpm=epel-release-6-8.noarch.rpm
rpmforgeRpm=rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
remiRpm=remi-release-6.rpm
ruby=ruby-1.9.3-p448
rubygems=rubygems-2.0.3

# base update 
yum -y update

# regist repository
if [ ! -e "/etc/yum.repos.d/epel.repo" ]; then
  curl -O http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/${epelRpm}
  rpm -ivh ${epelRpm}
fi
if [ ! -e "/etc/yum.repos.d/rpmforge.repo" ]; then
  rpm -ivh http://apt.sw.be/redhat/el6/en/x86_64/rpmforge/RPMS/${rpmforgeRpm}
fi
if [ ! -e "/etc/yum.repos.d/remi.repo" ]; then
  rpm -ivh http://rpms.famillecollet.com/enterprise/${remiRpm}
  sed -i '5s/enabled=0/enabled=1/' /etc/yum.repos.d/remi.repo
fi
 
# scp
yum -y install openssh-clients

# make ruby
yum -y install \
 gcc \
 gcc-c++ \
 g++ \
 make \
 automake \
 autoconf \
 curl-devel \
 httpd-devel \
 apr-devel \
 apr-util-devel \
 sqlite \
 sqlite-devel
yum -y install openssl-devel zlib-devel readline-devel
yum -y install libyaml libyaml-devel

# ruby
cd /usr/local/src
curl -O ftp://ftp.ruby-lang.org/pub/ruby/1.9/${ruby}.tar.bz2
tar xf ${ruby}.tar.bz2
cd ${ruby}
./configure --prefix=/usr/local/ruby/${ruby} --enable-shared
make
make test
make install

# rubygems
cd /usr/local/src
curl -O http://production.cf.rubygems.org/rubygems/${rubygems}.tgz
tar xf ${rubygems}.tgz
cd ${rubygems}
/usr/local/ruby/${ruby}/bin/ruby setup.rb

