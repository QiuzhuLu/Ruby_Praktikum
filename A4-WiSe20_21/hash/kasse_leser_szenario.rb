require_relative "kasse_leser"
require_relative "../utils"

leser = KasseLeser.new()
pp_nested_hash(leser.als_hash())