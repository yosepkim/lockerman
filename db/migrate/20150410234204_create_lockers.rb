class CreateLockers < ActiveRecord::Migration
  def change
    create_table :lockers do |t|
      t.integer :locker_size_id
      t.string :display_name
      t.boolean :occupied

      t.timestamps
    end
  end
end
