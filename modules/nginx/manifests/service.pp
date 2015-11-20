#- file:  modules/nginx/manifests/service.pp
#- Class: nginx::service
#
# Class to service nginx 
#
class nginx::service {

  service { 'nginx':
    ensure  => running
  }

}
