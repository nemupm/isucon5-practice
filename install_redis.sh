# CentOS 6.x
sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo yum --enablerepo=epel -y install redis
sudo /etc/init.d/redis start
sudo chkconfig redis on
