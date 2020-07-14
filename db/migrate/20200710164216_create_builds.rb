class CreateBuilds < ActiveRecord::Migration[6.0]
  def change
    create_table :builds do |t|
      t.string :weapon_skill_name
      t.string :assist
      t.string :special
      t.string :passivea
      t.string :passiveb
      t.string :passivec
      t.string :hero_image_url
      t.string :hero_name
      t.integer :user_id

      t.timestamps
    end
  end
end
