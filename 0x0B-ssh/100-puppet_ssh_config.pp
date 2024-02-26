# using puppet to configure the system
include stdlib

file_line { '/etc/ssh/sshd_config':
  ensure  => present,
  path    => '/etc/ssh/sshd_config',
  content => 'PasswordAuthentication no',
}

file_line { '~/.ssh/scool':
  ensure  => present,
  path    => '~/etc/ssh/sshd_config',
  content => 'IdentityFile ~/.ssh/school',
}
