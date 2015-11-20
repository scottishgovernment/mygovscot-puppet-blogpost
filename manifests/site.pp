#- file:  manifests/site.pp
#
#  Base file to import the classes for each node
#

node default {
  hiera_include('classes')
}
