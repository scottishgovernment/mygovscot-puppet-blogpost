#- file:  modules/nginx/manifests/init.pp
#- Class: nginx
#
# Main class to install & setup nginx 
#
class nginx {

  include nginx::install
  include nginx::config
  include nginx::service

  Class['nginx::install'] ->
  Class['nginx::config'] ->
  Class['nginx::service']

}
