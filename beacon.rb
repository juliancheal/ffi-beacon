require 'ffi'
module Beacon
  extend FFI::Library
  
  ffi_lib 'objc', '/System/Library/Frameworks/Foundation.framework/Foundation', '/System/Library/Frameworks/IOBluetooth.framework/IOBluetooth',
  'bin/ibeacon'
  
  attach_function :print_usage, [], :void
  attach_function :print_version, [], :void
  callback :completion_function, [:string, :int, :int, :int, :int], :int
  
  attach_function :startWithTimeInterval, [:double, :completion_function], :void
end

# Beacon.print_usage
# Beacon.print_version
# trap("INT") { puts "Shutting down."; exit}
trap("INT") { exit! }


# Beacon.startWithTimeInterval(1.1)
callback = Proc.new do |uuid, major, minor, power, rssi|
  puts "uuid: #{uuid}, major: #{major}, minor: #{minor}, power: #{power}, rssi: #{rssi}"
  return 1
end
Beacon.startWithTimeInterval(1.1,callback)