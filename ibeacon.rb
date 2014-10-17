$:.unshift File.join(File.dirname(__FILE__))

require 'beacon'

class Ibeacon
  def scan(interval=1.1)
    Beacon.scan(interval)
  end
end

beacon = Ibeacon.new
puts beacon.scan