# Puppet manifest to replace a line in a file with another line

exec { 'replace1':
  provider => shell,
  command  => 'sudo sed -i "s/nofile 5/nofile 10000/" /etc/security/limits.conf',
  before   => Exec['replace2'],
}

exec { 'replace2':
  provider => shell,
  command  => 'sudo sed -i "s/nofile 5/nofile 40000/" /etc/security/limits.conf',
}
