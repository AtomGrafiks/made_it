class CreatePermissionsRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions_relations do |t|
      t.references :permission, foreign_key: true
      t.references :relationable, polymorphic: true, index: {name: :permissions_relationable_polymorphic_association}
      t.datetime :begin_at
      t.datetime :end_at

      t.timestamps
    end
    add_index :permissions_relations, :relationable_id
  end
end
