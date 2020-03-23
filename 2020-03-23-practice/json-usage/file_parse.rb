require 'json'

string_info = File.read(File.expand_path('data.json', __dir__))
pp string_info

object_data = JSON.parse(string_info)
pp object_data
