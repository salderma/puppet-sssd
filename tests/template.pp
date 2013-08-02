#
# Testing configuration file provisioning via template
# Auditing enabled
#
class { 'sssd':
  template => 'sssd/tests/test.conf',
  audit    => 'all',
}
