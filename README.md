# centos6-ruby
===========

CentOS minimal + Ruby 1.9.3 + RubyGems 2.0.3 with epel, rpmforge, remi repositories

## How to setup

    curl https://raw.github.com/hiro345/centos6-ruby/master/setup.sh | sudo sh -

## ruby

    # ruby=ruby-1.9.3-p392;/usr/local/ruby/${ruby}/bin/ruby -v
    # ruby=ruby-1.9.3-p448;/usr/local/ruby/${ruby}/bin/ruby -v
    ruby 1.9.3p448 (2013-06-27 revision 41675) [i686-linux]
    # echo "puts 'hello ruby'" | /usr/local/ruby/${ruby}/bin/ruby
    hello ruby

