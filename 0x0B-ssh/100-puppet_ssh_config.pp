# using puppet to configure the system

file { '/etc/ssh/sshd_config':
  ensure  => present,
  path    => '/etc/ssh/sshd_config',
  content => 'PasswordAuthentication no',
}

file { '~/.ssh/scool':
  ensure  => present,
  path    => '~/.ssh/school',
  content => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZt'
}
