class AddUserIdToPosts < ActiveRecord::Migration[7.1]
  def change
    change_table :posts do |t|
      t.references :user, foreign_key: true, null: false
    end
  end
end
