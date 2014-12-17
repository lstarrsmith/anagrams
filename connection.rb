require 'active_record'

ActiveRecord::Base.establish_connection('postgresql://' + ENV["DB_INFO"] + '@127.0.0.1/anagrams')

# ActiveRecord::Base.establish_connection({
#   :adapter => "postgresql",
#   :host => "localhost",
#   :username => "Logan",
#   :database => "anagrams"
#   })

  ActiveRecord::Base.logger = Logger.new(STDOUT)