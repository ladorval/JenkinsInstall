Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  ####### Provision #######
  config.vm.provision "docker" do |docker|
    docker.build_image "/vagrant",
      args: "-t ladorval/jenkins"
    docker.run "jenkins",
      image: "ladorval/jenkins:latest",
      args: "-p 8000:8000 -v 'jenkins_home:/var/jenkins_home' -e JENKINS_OPT=' --httpPort=8000'"
  end
end
