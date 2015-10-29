class shinken::users::shinken_user inherits shinken {
    group { 'shinken':
        ensure => present,
	gid    => $shinken_gid,
        system => true,
    } ->
    user { 'shinken':
        ensure     => present,
        comment    => 'shinken user',
	uid        => $shinken_uid,
        gid        => 'shinken',
        shell      => '/bin/bash',
        home       => $shinken_user_home,
        require    => Group['shinken'],
        system     => true,
        managehome => true,
    } ->

    class { "shinken::users::authorized_keys": } 

#    ssh_authorized_key { 'shinken':
#        user => 'shinken',
#        type => $shinken_ssh_type,
#        key  => $shinken_pubkey
#        }
}

class shinken::users::nagios_user inherits shinken {
    exec { 'change nagios shell':
        command => 'usermod -s /bin/bash nagios',
        unless  => "egrep '^nagios:.*:/bin/bash$' /etc/passwd",
    }
    ssh_authorized_key { 'nagios':
        name => 'shinken-nagios',
        user => 'nagios',
        type => $shinken_ssh_type,
        key  => $shinken_pubkey,
    }
}

class shinken::users::authorized_keys inherits shinken {
    file { "$shinken_user_home/.ssh":
        ensure => directory,
        owner  => 'shinken',
        group  => 'shinken',
        mode   => 0700,
    }
    file { "$shinken_user_home/.ssh/authorized_keys":
        ensure => present,
        mode   => 0600,
        owner  => 'shinken',
        group  => 'shinken',
        source => "puppet:///modules/shinken/$shinken_pubkey",
        require => File["$shinken_user_home/.ssh"],
    }
}
