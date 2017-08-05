class s_bitbaker ($poky_branch = 'pyro') {
  $yocto_packages = ['gawk', 'wget', 'git-core', 'diffstat', 'unzip', 'texinfo',
    'gcc-multilib', 'build-essential', 'chrpath', 'socat', 'cpio', 'python',
    'python3', 'python3-pip', 'python3-pexpect', 'xz-utils', 'debianutils',
    'iputils-ping', 'libsdl1.2-dev', 'xterm', 'iotop']

  ensure_packages($yocto_packages)

  file {'/mnt':
    ensure => directory,
    owner  => 'root',
    group  => 'admin',
    mode   => '0664',
  }

  vcsrepo { '/mnt/poky':
    ensure   => present,
    provider => git,
    source   => 'git://git.yoctoproject.org/poky',
    revision => $poky_branch,
  }
}
