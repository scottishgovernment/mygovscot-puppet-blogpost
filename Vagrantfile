VAGRANTFILE_API_VERSION = "2"
require 'yaml'

# Path to directory containing this Vagrantfile with any symlinks resolved.
directory = Pathname.new(File.realpath(__FILE__)).parent()

# Relative path from the Vagrant shared folder to that directory.
rpath = directory.relative_path_from(Pathname.new(File.absolute_path(__FILE__)).parent())

serversFile = File.exists?("servers.yaml") ? "servers.yaml" : directory.join("servers.yaml")
servers = YAML.load_file(serversFile)

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  servers.each do |server|
    config.vm.define server["name"] do |cfg|

      cfg.vm.box = server["box"]
      cfg.vm.box_url = server["box_url"]
      cfg.vm.hostname = server["name"]

      cfg.vm.provider "virtualbox" do |v|
        v.memory  = server["ram"] || "2048"
        v.cpus = server["cpu"] || "2"
      end

      (server['forwarded_port'] || []).each do |i, port|
        if port['guest'] != '' && port['host'] != ''
          cfg.vm.network :forwarded_port, guest: port['guest'].to_i, host: port['host'].to_i
        end
      end

      hiera = rpath.join('hiera')
      cfg.vm.provision "shell", :inline => <<-SHELL
        cd /tmp
        dpkg -P puppet
        curl -sSfO https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
        dpkg -i puppetlabs-release-trusty.deb
        apt-get -qq update
        apt-get install -y puppet-common
        gem install hiera-eyaml
        mkdir -p /etc/puppet/keys
        ln -sf /vagrant/#{hiera}/hiera.yaml /etc/hiera.yaml
        find /var/lib/hiera
        rm -r /var/lib/hiera && ln -snf /vagrant/#{hiera}/hieradata /var/lib/hiera
        cd /vagrant/#{rpath}
        export FACTER_machine_env=#{server["env"]}
        export FACTER_machine_role=#{server["role"]}
        puppet apply --modulepath=modules --hiera_config=hiera/hiera.yaml manifests/site.pp
      SHELL

    end
  end

  config.ssh.forward_agent = true

end
