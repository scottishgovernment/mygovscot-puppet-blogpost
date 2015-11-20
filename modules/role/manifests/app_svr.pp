#- file:  modules/role/manifests/app_svr.pp
#- Class: role::app_svr
#
# Class to define an app server role
#
class role::app_svr {

 include profile::base
 include profile::app

}
