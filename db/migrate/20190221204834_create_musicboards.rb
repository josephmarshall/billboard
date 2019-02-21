class CreateMusicboards < ActiveRecord::Migration[5.2]
  def change
    create_table :musicboards do |t|
      t.string :name

      t.timestamps
    end
  end
end
