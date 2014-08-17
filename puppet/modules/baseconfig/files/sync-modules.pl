#!/usr/bin/perl
my @repo;
system("rm -rf puppet-enterprise-modules");
system("git clone -b develop git\@gitolite.staples.com:puppet-enterprise-modules");

open(DATA, "</root/puppet-enterprise-modules/Puppetfile");

while(<DATA>)
{
  if( /gitolite/ )
  {
    if( /:git => '(.*)?\/(\S*)'/ )
    {
      if( -d "/etc/puppetlabs/puppet/modules/$2" )
      {
        system("cd /etc/puppetlabs/puppet/modules/$2;git pull");
      }
      else
      {
        system("git clone $1/$2 /etc/puppetlabs/puppet/modules/$2");
      }
    }
  }
  if( /github.com/ )
  {
    if( /:git => '(.*)?\/(\S*).git'/ )
    {
      @repo = split('-', $2);
      if( -d "/etc/puppetlabs/puppet/modules/@repo[1]" )
      {
        system("cd /etc/puppetlabs/puppet/modules/@repo[1];git pull");
      }
      else
      {
        system("git clone $1/$2.git /etc/puppetlabs/puppet/modules/@repo[1]");
      }
    }
  }
}
