# using puppet to configure the system

file_line {
  'passAuth':
  ensure => present,
  path   => '/etc/ssh/sshd_config',
  line   => 'PasswordAuthentication no',
  ;
  'keyLocation':
  ensure => present,
  path   => '/etc/ssh/sshd_config',
  line   => 'IdentityFile ~/.ssh/school',
}
