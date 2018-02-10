require 'active_record'
require 'mysql2'
require 'sqlite3'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
# ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development'])
ActiveRecord::Base.establish_connection(ENV['ENV'].to_sym)
class Topic < ActiveRecord::Base 
end
