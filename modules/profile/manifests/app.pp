#- file:  modules/profile/manifests/app.pp
#- Class: profile::app
#
# Class to incorporate all app components
#
class profile::app {

   class { 'jre': } ->
   class { 'tomcat': }
 

}
