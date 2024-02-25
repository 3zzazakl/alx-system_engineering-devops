file { 'pass':
    ensure  => persent,
    path    => '/etc/ssh/sshd_config',
    line    => 'PasswordAuthentication no',
}

file { 'Key':
    ensure  => present,
    path    => '/etc/ssh/sshd_config',
    line    => 'IdentityFile ~/.ssh/school',
}
