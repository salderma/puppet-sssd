# Puppet module: sssd

This is a Puppet module for sssd.
It manages its installation, configuration and service.

The blueprint of this module is from http://github.com/Example42-templates/

Released under the terms of Apache 2 License.


## USAGE - Basic management

* Install sssd with default settings (package installed, service started, default configuration files)

        class { 'sssd': }

* Remove sssd package and purge all the managed files

        class { 'sssd':
          ensure => absent,
        }

* Install a specific version of sssd package

        class { 'sssd':
          version => '1.0.1',
        }

* Install the latest version of sssd package

        class { 'sssd':
          version => 'latest',
        }

* Enable sssd service (both at boot and runtime). This is default.

        class { 'sssd':
          status => 'enabled',
        }

* Disable sssd service (both at boot and runtime)

        class { 'sssd':
          status => 'disabled',
        }

* Ensure service is running but don't manage if is disabled at boot

        class { 'sssd':
          status => 'running',
        }

* Ensure service is disabled at boot and do not check it is running

        class { 'sssd':
          status => 'deactivated',
        }

* Do not manage service status and boot condition

        class { 'sssd':
          status => 'unmanaged',
        }

* Do not automatically restart services when configuration files change (Default: true).

        class { 'sssd':
          autorestart => false,
        }

* Enable auditing (on all the arguments)  without making changes on existing sssd configuration *files*

        class { 'sssd':
          audit => 'all',
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'sssd':
          noops => true,
        }


## USAGE - Overrides and Customizations
* Use custom source for main configuration file 

        class { 'sssd':
          source => [ "puppet:///modules/example42/sssd/sssd.conf-${hostname}" ,
                      "puppet:///modules/example42/sssd/sssd.conf" ], 
        }


* Use custom source directory for the whole configuration dir.

        class { 'sssd':
          dir_source       => 'puppet:///modules/example42/sssd/conf/',
        }

* Use custom source directory for the whole configuration dir purging all the local files that are not on the dir_source.
  Note: This option can be used to be sure that the content of a directory is exactly the same you expect, but it is desctructive and may remove files.

        class { 'sssd':
          dir_source => 'puppet:///modules/example42/sssd/conf/',
          dir_purge  => true, # Default: false.
        }

* Use custom source directory for the whole configuration dir and define recursing policy.

        class { 'sssd':
          dir_source    => 'puppet:///modules/example42/sssd/conf/',
          dir_recursion => false, # Default: true.
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'sssd':
          template => 'example42/sssd/sssd.conf.erb',
        }

* Use a custom template and provide an hash of custom configurations that you can use inside the template

        class { 'sssd':
          template => 'example42/sssd/sssd.conf.erb',
          options  => {
            opt  => 'value',
            opt2 => 'value2',
          },
        }

* Specify the name of a custom class to include that provides the dependencies required by the module for full functionality. Use this if you want to use alternative modules to manage dependencies.

        class { 'sssd':
          dependency_class => 'example42::dependency_sssd',
        }

* Automatically include a custom class with extra resources related to sssd.
  Here is loaded $modulepath/example42/manifests/my_sssd.pp.
  Note: Use a subclass name different than sssd to avoid order loading issues.

        class { 'sssd':
          my_class => 'example42::my_sssd',
        }

## TESTING
[![Build Status](https://travis-ci.org/salderma/puppet-sssd.png?branch=master)](https://travis-ci.org/salderma/puppet-sssd)
