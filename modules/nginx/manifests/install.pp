#- file:  modules/nginx/manifests/install.pp
#- Class: nginx::install
#
# Class to install nginx 
#
class nginx::install {

  package { 'nginx':
    ensure  => latest
  }

  file {'/usr/share/nginx/html/':
    ensure => 'directory',
    owner  => 'root',
    mode   => '0644',
  }

}
