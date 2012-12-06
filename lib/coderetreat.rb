%w{setable_matrix player ai_player game_board game array}.each do |f|
  require File.join(File.dirname(__FILE__), f)
end
