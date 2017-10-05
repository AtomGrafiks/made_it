# :nodoc:
class GroupsRelation < ApplicationRecord
  belongs_to :group, inverse_of: :groups_relations, touch: true
  belongs_to :relationable, polymorphic: true, touch: true

  validates     :group,         presence: true,
                                uniqueness: { scope: %i[relationable_id relationable_type] }
  validates     :relationable,  presence: true
end
