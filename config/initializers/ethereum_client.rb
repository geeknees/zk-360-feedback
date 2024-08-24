require "eth"

ETHEREUM_CLIENT = Eth::Client.create(ENV["RPC_URL"])
