# :nodoc:
class Permission < ApplicationRecord

  polymorphic_many_and_through    :permissions_relations, :relationable, %w[User Group Extern]

  validates     :name,            presence: true,
                                  uniqueness: true

end
