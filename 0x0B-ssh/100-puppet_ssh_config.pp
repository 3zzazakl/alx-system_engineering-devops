# using puppet to configure the system

file_line {
  '/etc/ssh/sshd_config':
  ensure => present,
  path   => '/etc/ssh/sshd_config',
  line   => 'PasswordAuthentication no',
  ;
  '~/.ssh/school':
  ensure => present,
  path   => '/etc/ssh/sshd_config',
  line   => 'IdentityFile ~/.ssh/school',
}
