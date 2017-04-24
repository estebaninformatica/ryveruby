require 'test_helper'
# ENV["RYVER_URL"] = "www.bubub.com"
ENV["TEAM_CODE"] = "IyocIW2IFuGipL"

class RyverubyTest < Minitest::Test

  def test_invalid_without_ryver_team_code
    assert Ryveruby::Sender.call(team_code: "")[:errors].first[:title] , "Required params"
  end

  def test_invalid_without_text
    assert Ryveruby::Sender.call(text: "")[:errors].first[:title] , "Required params"
  end
    
  def test_valid_sender
    byebug
    assert Ryveruby::Sender.call(text: "Hola",team_code: ENV["TEAM_CODE"])
  end

  # Que testear ?
  # Las respuestas 
end
