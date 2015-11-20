#- file:  modules/profile/manifests/web.pp
#- Class: profile::web
#
# Class to incorporate all web components
#
class profile::web {

   class { 'nginx': } 

}
