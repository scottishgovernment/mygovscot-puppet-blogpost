#- file:  modules/tomcat/manifests/install.pp
#- Class: tomcat::install
#
# Class to install tomcat 
#
class tomcat::install {

  package { 'tomcat7':
    ensure  => latest
  }

}
