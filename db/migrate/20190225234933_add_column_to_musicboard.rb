class AddColumnToMusicboard < ActiveRecord::Migration[5.2]
  def change
    add_reference :musicboards, :user, foreign_key: true
  end
end
