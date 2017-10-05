class User < ApplicationRecord
  has_many_through :projects
  has_many_through :groups, association_table: :groups_relations, as: :relationable
  has_many_through :permissions, association_table: :permissions_relations, as: :relationable

  validates :login,   uniqueness: true
end
