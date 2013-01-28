require 'rubygems'

lib = File.dirname(__FILE__)
lib += '/enoteclient/'

require lib + 'version'
require lib + 'resource'
require lib + 'enoteclient'

Dir["#{File.dirname(__FILE__)}/enoteclient/resource/*.rb"].each do |resource|
  begin
    require resource
  rescue Exception => e
    puts "WARNING: #{File.basename(gateway)} was not loaded: #{e}"
  end
end

module EnoteClient
  class Resource
  end
end
