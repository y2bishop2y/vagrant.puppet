# == Class: helloworld
#
# This class is a bare bones example to ensure puppet master/client are
# taking to each other.
#
#
class helloworld {

  file { '/tmp/hello':
    owner   => 'root',
    group   => 'root',
    mode    => '0666',
    content => 'world this is a test\n',
  }
    
}
