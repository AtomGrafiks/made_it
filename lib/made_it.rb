require 'made_it/active_record'

module MadeIt
  # Your code goes here...
end

class ActiveRecord::Base
  include MadeIt::ActiveRecord
end
