require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "Logan",
  :database => "anagrams"
  })

  ActiveRecord::Base.logger = Logger.new(STDOUT)