class ApplicationRecord < ActiveRecord::Base
  include MadeIt::ActiveRecord

  self.abstract_class = true
end
