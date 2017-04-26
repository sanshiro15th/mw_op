class CreateTroubles < ActiveRecord::Migration
  def change
    create_table :troubles do |t|
      t.datetime :trbl_start
      t.datetime :trbl_end
      t.string   :vm_name
      t.integer  :user_num
      t.text     :about
      t.integer  :user_id
      t.timestamps
    end
  end
end
