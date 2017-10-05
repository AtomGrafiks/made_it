# :nodoc:
class PermissionsRelation < ApplicationRecord
  belongs_to    :permission, inverse_of: :permissions_relations, touch: true
  belongs_to    :relationable,  polymorphic: true, touch: true

  validates     :permission,    presence: true,
                                uniqueness: { scope: %i[relationable_id relationable_type] }
  validates     :relationable,  presence: true
end
