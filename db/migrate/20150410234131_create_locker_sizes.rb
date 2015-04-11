class CreateLockerSizes < ActiveRecord::Migration
  def change
    create_table :locker_sizes do |t|
      t.string :name

      t.timestamps
    end
  end
end
