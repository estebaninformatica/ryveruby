module Ryveruby
  class Sender
    attr_reader :team_code, :text, :ryver_url

    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @team_code = params[:team_code]
      @text = params[:text]
      @connection = Faraday.new(RYVER_URL)
    end

    def call
      connection.post "/application/webhook/#{team_code}", {body: text}
    end
  end
end