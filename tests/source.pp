#
# Testing configuration file provisioning via source
# Auditing enabled
#
class { 'sssd':
  source => 'puppet:///modules/sssd/tests/test.conf',
  audit  => 'all',
}
