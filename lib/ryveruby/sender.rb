module Ryveruby
  class Sender
    
    attr_reader :team_code, :text, :ryver_url, :errors

    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @team_code = params[:team_code]
      @text = params[:text]
      @connection = Ryveruby::Connection.new
    end

    def call
      valid?
      unless @errors
        @connection.post(team_code:team_code, text:text)
      else
        return @errors
      end
    end

    private 
    
    def valid? 
      if @team_code.to_s.empty? or @text.to_s.empty?
        @errors = {
          "errors": [
            {
              "title":  "Required params",
              "detail": "Team code and text are required."
            }
          ]
        }
      end
    end

  end
end