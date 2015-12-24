name             "nginx_example"
maintainer       "clay thomas"
maintainer_email "crthomas81@gmail.com"
license          "All rights reserved"
description      "A Chef cookbook to setup nginx with an example web page"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends 'yum'
supports 'centos'