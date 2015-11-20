- name: Puppet1
  box: trusty
  box_url: https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box
  env: tst
  role: web_svr
  ram:  1048
  cpus: 1
  forwarded_port:
    web:
       host: 8080
       guest: 80
- name: Puppet2
  box: trusty
  box_url: https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box
  env: tst
  role: app_svr
  ram:  1048
  cpus: 1
  forwarded_port:
    app:
       host: 9090
       guest: 8080
