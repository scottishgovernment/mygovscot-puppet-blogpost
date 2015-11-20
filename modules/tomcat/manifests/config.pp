#- file:  modules/tomcat/manifests/config.pp
#- Class: tomcat::config
#
# Class to configure tomcat 
#
class tomcat::config {

  file { 'tomcat-html':
    ensure  => file,
    path    => '/var/lib/tomcat7/webapps/ROOT/index.html',
    require => Package['tomcat7'],
    content => template( "tomcat/index.html.erb" ),
    notify  => Service['tomcat7']
  }
  
}
