class CreateGroupsRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_relations do |t|
      t.references :group, foreign_key: true
      t.references :relationable, polymorphic: true, index: {name: :groups_relationable_polymorphic_association}
      t.references :campus, foreign_key: true
      t.datetime :begin_at
      t.datetime :end_at

      t.timestamps
    end
    add_index :groups_relations, :relationable_id
  end
end
