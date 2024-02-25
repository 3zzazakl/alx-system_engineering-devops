file { 'pass':
    ensure  => persent,
    path    => '/etc/ssh/sshd_config',
    content => 'PasswordAuthentication no',
  ;
  'Key':
    ensure  => present,
    path    => '/etc/ssh/sshd_config',
    content => 'IdentityFile ~/.ssh/school',
}
