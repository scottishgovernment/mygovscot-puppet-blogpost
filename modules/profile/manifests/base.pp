#- file:  modules/profile/manifests/base.pp
#- Class: profile::base
#
# Class to install the base requirements for any host
#
class profile::base {

    package { "ntp": 
        ensure => installed 
    }

    service { "ntp":
        ensure  => running,
        require => Package['ntp']
    }

}
