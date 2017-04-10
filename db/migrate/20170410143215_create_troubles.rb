class CreateTroubles < ActiveRecord::Migration
  def change
    create_table :troubles do |t|

      t.timestamps null: false
    end
  end
end
