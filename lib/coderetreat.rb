require 'pry'
%w{}.each do |f|
  require File.join(File.dirname(__FILE__), f)
end
