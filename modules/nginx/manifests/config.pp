#- file:  modules/nginx/manifests/config.pp
#- Class: nginx::config
#
# Class to configure nginx 
#
class nginx::config {

 $picture = hiera('picture')

  file { 'nginx-html':
    ensure  => file,
    path    => '/usr/share/nginx/html/index.html',
    require => [ Package['nginx'], File['/usr/share/nginx/html/'] ],
    content => template( "nginx/index.html.erb" ),
    notify  => Service['nginx']
  }

  file { 'image-source':
    ensure  => file,
    path    => "/usr/share/nginx/html/${picture}",
    require => [ Package['nginx'], File['/usr/share/nginx/html/'] ], 
    source  => "puppet:///modules/nginx/${picture}",
    owner  => 'www-data',
    group  => 'www-data',
    mode   => '0750',
    notify  => Service['nginx']
  }

}
