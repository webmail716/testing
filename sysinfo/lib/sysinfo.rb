require 'socket'
require 'rbconfig'

def get_system_info
  {
    hostname: Socket.gethostname,
    ip_address: IPSocket.getaddress(Socket.gethostname),
    os: RbConfig::CONFIG['host_os']
  }
end

info = get_system_info
info.each { |key, value| puts "#{key}: #{value}" }

