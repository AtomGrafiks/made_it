class Project < ApplicationRecord
  has_many_through :users

  validates :name,   uniqueness: true
end
