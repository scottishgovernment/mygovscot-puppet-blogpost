#- file:  modules/jre/manifests/init.pp
#- Class: jre
#
# Main class to install the java jre required for applications
#
class jre {

  package { 'openjdk-7-jre':
    ensure  => latest
  }

}
