module Ryveruby
  class Sender
    attr_reader :team_code, :text, :ryver_url, :errors
    RYVER_URL = ENV["RYVER_URL"]
    RYVER_URL ||= "https://aerolaplata.ryver.com"

    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @team_code = params[:team_code]
      @text = params[:text]
      @connection = Faraday.new(RYVER_URL)
    end

    def call
      valid?
      unless @errors
        @connection.post "/application/webhook/#{team_code}", {body: text}
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
              "status": "422",
              "title":  "Required params",
              "detail": "Team code and text are required."
            }
          ]
        }
      end
    end

  end
end