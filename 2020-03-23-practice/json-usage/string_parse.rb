require 'json'

object_data = JSON.parse('[1, 2, 3]')
pp object_data

string_data = '{"info": 123}'
object_data = JSON.parse(string_data)
pp object_data
