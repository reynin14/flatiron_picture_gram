class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.integer :password_digest

      t.timestamps
    end
  end
end
