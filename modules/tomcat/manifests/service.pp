#- file:  modules/tomcat/manifests/service.pp
#- Class: tomcat::service
#
# Class to service tomcat 
#
class tomcat::service {

  service { 'tomcat7':
    ensure  => running
  }

}
