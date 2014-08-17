# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  exec { 'yum update':
    command => '/usr/bin/yum update -y';
  }

  file { '/home/vagrant/.bash_profile': 
    owner       => 'vagrant',
    group       => 'vagrant',
    mode        => '0750',
    source => 'puppet:///modules/baseconfig/bash_profile',
  }

  file { '/home/vagrant/.ls_colors':
    owner       => 'vagrant',
    group       => 'vagrant',
    mode        => '0750',
    source => 'puppet:///modules/baseconfig/ls_colors',
  }

  file { '/home/vagrant/.gitbashrc':
    owner       => 'vagrant',
    group       => 'vagrant',
    mode        => '0750',
    source => 'puppet:///modules/baseconfig/gitbashrc',
  }

  file { '/tmp/sync-modules.pl':
    owner       => 'vagrant',
    group       => 'vagrant',
    mode        => '0750',
    source => 'puppet:///modules/baseconfig/sync-modules.pl',
  }

  file { '/home/vagrant/.vim':
    owner       => 'vagrant',
    group       => 'vagrant',
    mode        => '0750',
    recurse   => true,
    source    => 'puppet:///modules/baseconfig/vim';
  }

  file { '/modules':
    ensure      => link,
    target      => "/etc/puppetlabs/puppet/modules",
  }

  exec { '/tmp/modules-sync.pl':
    cwd          => '/modules',
    user         => 'vagrant',
    require      => File['/tmp/modules-sync.pl','/modules'],
  }
}
