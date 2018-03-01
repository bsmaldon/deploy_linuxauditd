# Class: deploy_linuxauditd::inputs
# ===========================
#
# Configure inputs for deploy_linuxauditd
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `input_disabled`
# Whether the input for audit logs from this server should be disabled in the
# splunk forwarder
#
# * `index`
# Which splunk index audit logs from this server should be forwarded to
#
# Authors
# -------
#
# Berin Smaldon <noodels555@gmail.com>
#
class deploy_linuxauditd::inputs (
  Boolean $disabled = false,
  String $index
){

  file { '/opt/splunkforwarder/etc/apps/TA_linux-auditd/local/inputs.conf':
    ensure  => present,
    content => template('deploy_linuxauditd/inputs.conf.erb'),
    owner   => 'splunk',
    group   => 'splunk',
    notify  => Service['splunk']
  }

}
