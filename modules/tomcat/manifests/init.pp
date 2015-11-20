#- file:  modules/tomcat/manifests/init.pp
#- Class: tomcat
#
# Main class to install & setup tomcat 
#
class tomcat {

  include tomcat::install
  include tomcat::config
  include tomcat::service

  Class['tomcat::install'] ->
  Class['tomcat::config'] ->
  Class['tomcat::service'] 

}
