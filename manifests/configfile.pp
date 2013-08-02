#
# = Define: sssd::configfile
#
# The define manages sssd configfile
#
#
# == Parameters
#
# [*ensure*]
#   String. Default: present
#   Manages configfile presence. Possible values:
#   * 'present' - Install package, ensure files are present.
#   * 'absent' - Stop service and remove package and managed files
#
# [*template*]
#   String. Default: Provided by the module.
#   Sets the path of a custom template to use as content of configfile
#   If defined, configfile file has: content => content("$template")
#   Example: template => 'site/configfile.conf.erb',
#
# [*options*]
#   Hash. Default undef. Needs: 'template'.
#   An hash of custom options to be used in templates to manage any key pairs of
#   arbitrary settings.
#
define sssd::configfile (
  $ensure   = present,
  $template = 'sssd/configfile.erb' ,
  $options  = '' ,
  $ensure  = present ) {

  include sssd

  file { "sssd_configfile_${name}":
    ensure  => $ensure,
    path    => "${sssd::dir_path}/${name}",
    mode    => $sssd::file_mode,
    owner   => $sssd::file_owner,
    group   => $sssd::file_group,
    require => Package[$sssd::package],
    notify  => $sssd::file_notify,
    content => template($template),
    replace => $sssd::file_replace,
    audit   => $sssd::file_audit,
    noop    => $sssd::noops,
  }

}
