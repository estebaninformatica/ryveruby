module Ryveruby
  class Connection

    ENV["RYVER_URL"] ||= "https://aerolaplata.ryver.com"
    RYVER_URL = ENV["RYVER_URL"]
    attr_reader :response

    def initialize
      @connection = Faraday.new(RYVER_URL)
    end

    def post(text:, team_code:)
      @response = @connection.post "/application/webhook/#{team_code}", {body: text}
      ok?
    end

    def ok?
      @response.success?
    end
  end
end
