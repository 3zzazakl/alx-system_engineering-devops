# using puppet to configure the system
include stdlib

file_line { '/etc/ssh/sshd_config':
  ensure => present,
  path   => '/etc/ssh/sshd_config',
  line   => 'PasswordAuthentication no',
}
file_line { '~/.ssh/school':
  ensure => present,
  path   => '/etc/ssh/sshd_config',
  line   => 'IdentityFile ~/.ssh/school',
}
