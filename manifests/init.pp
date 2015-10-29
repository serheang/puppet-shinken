# == Class: shinken
#
# Full description of class shinken here.
#
# === Authors
#
# Ser Heang, Tan <serheang+git@gmail.com>
#
# === Copyright
#
#

class shinken (
    $shinken_uid        = $shinken::params::shinken_uid,
    $shinken_gid        = $shinken::params::shinken_gid,
    $package_ensure     = $shinken::params::package_ensure,
    $service_ensure     = $shinken::params::service_ensure,
    $service_enable     = $shinken::params::service_enable,
    $service_manage     = $shinken::params::service_manage,
    $package_name       = $shinken::params::package_name,
    $service_name       = $shinken::params::service_name,
    $shinken_ssh_type   = $shinken::params::shinken_ssh_type,
    $shinken_pubkey     = $shinken::params::shinken_pubkey,
    $shinken_privkey     = $shinken::params::shinken_privkey,
    $shinken_user_home  = $shinken::params::shinken_user_home,
) inherits shinken::params {
    # not sure what to write here
    # All servers and nodes will get shinken user create
    class { 'shinken::users::shinken_user': }
}

class shinken::server inherits shinken {
    # Only server like poller will have shinken private key
    file { 'id_rsa':
        path   => "$shinken_user_home/.ssh/id_rsa",
        owner  => 'shinken',
        group  => 'shinken',
        mode   => '0600',
        source => "puppet:///modules/shinken/$shinken_privkey",
    }
}


class shinken::daemon::arbiter {
    # port 7770
}

class shinken::daemon::scheduler {
    # port 7768

}

class shinken::daemon::poller {
    # port 7771

}

class shinken::daemon::broker {
    # port 7772

}

class shinken::daemon::reactionner {
    # port 7769

}

class shinken::daemon::receiver {
    # port 7773

}

class shinken::daemon::synchronizer {
    # port 7765

}

