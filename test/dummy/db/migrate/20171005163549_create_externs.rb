class CreateExterns < ActiveRecord::Migration[5.1]
  def change
    create_table :externs do |t|
      t.string :login

      t.timestamps
    end
    add_index :externs, :login, unique: true
  end
end
