require 'ffi'
module Beacon
  extend FFI::Library
  
  ffi_lib 'objc', '/System/Library/Frameworks/Foundation.framework/Foundation', '/System/Library/Frameworks/IOBluetooth.framework/IOBluetooth',
  'bin/ibeacon'
  
  attach_function :print_usage, [], :void
  attach_function :print_version, [], :void
  attach_function :startWithTimeInterval, [:double], :void
end

# Beacon.print_usage
Beacon.print_version
# Beacon.startWithTimeInterval(1.1)