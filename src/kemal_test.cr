require "./kemal_test/*"
require "kemal"
require "json"
require "active_record"
require "postgres_adapter"
require "./models/**"
require "./controllers/**"

ENV["PG_USER"] = "root"
ENV["PG_HOST"] = "localhost"
ENV["PG_DATABASE"] = "kemal_test"

module KemalTest
  module Controllers
  end
end

get "/" do
  render "src/views/index.ecr"
end

Kemal.run