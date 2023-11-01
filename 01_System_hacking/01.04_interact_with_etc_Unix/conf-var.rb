require 'etc'

# configuration-dependent string variables
# not need to execute getconf

gnu_libc_version = Etc.confstr(Etc::CS_GNU_LIBC_VERSION)
puts "CS_GNU_LIBC_VERSION: #{gnu_libc_version}"

gnu_libpthread_version = Etc.confstr(Etc::CS_GNU_LIBPTHREAD_VERSION)
puts "CS_GNU_LIBPTHREAD_VERSION: #{gnu_libpthread_version}"

path = Etc.confstr(Etc::CS_PATH)
puts "CS_PATH: #{path}"

# POSIX variables

arg_max = Etc.sysconf(Etc::SC_ARG_MAX)
puts "SC_ARG_MAX: #{arg_max}"

login_name_max = Etc.sysconf(Etc::SC_LOGIN_NAME_MAX)
puts "SC_LOGIN_NAME_MAX: #{login_name_max}"

line_max = Etc.sysconf(Etc::SC_LINE_MAX)
puts "SC_LINE_MAX: #{line_max}"
