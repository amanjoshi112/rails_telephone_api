class CreateMobiles < ActiveRecord::Migration[7.0]
  def change
    create_table :mobiles do |t|
      t.string :mobile

      t.timestamps
    end

    add_index :mobiles, :mobile, unique: true
  end
end
