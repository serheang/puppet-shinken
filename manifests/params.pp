class shinken::params {
    $shinken_uid       = '480'
    $shinken_gid       = '480'
    $package_ensure    = 'present'
    $service_ensure    = 'running'
    $service_enable    = true
    $service_manage    = true
    $package_name      = [ 'shinken' ]
    $service_name      = 'shinken'
    $shinken_ssh_type  = 'ssh-rsa'
    $shinken_pubkey    = 'id_rsa-shinken.pub'
    $shinken_prikey    = 'id_rsa-shinken'
    $shinken_user_home = '/var/lib/shinken'
}

