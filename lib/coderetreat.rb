require 'pry'
%w{array_2d player game_board array game}.each do |f|
  require File.join(File.dirname(__FILE__), f)
end
