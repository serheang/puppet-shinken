class shinken::packages {
    package { 'python-pycurl':
        ensure => installed,
    }
    package { 'python-paramiko':
        ensure => installed,
    }
    package { 'python-setuptools':
        ensure => installed,
    } ->
    package { 'python-pip':
        ensure => installed,
    } ->
    file { '/usr/bin/pip' :
        ensure => 'link',
        target => '/usr/bin/pip-python',
    } ->
    package { 'shinken':
        ensure   => '2.4',
        require  => Package['python-pip'],
        provider => 'pip',
    }

}
