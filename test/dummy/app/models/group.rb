# :nodoc:
class Group < ApplicationRecord
  polymorphic_many_and_through  :groups_relations, :relationable, %w[User Extern]
  has_many_through              :permissions, association_table: :permissions_relations, as: :relationable

  validates   :name,      presence: true,
                          uniqueness: true
 end
