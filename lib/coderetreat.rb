require 'pry'
%w{array array_2d game player board}.each do |f|
  require File.join(File.dirname(__FILE__), f)
end
