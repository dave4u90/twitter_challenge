class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true, foreign_key: true
      t.string     :twitter_screen_name, null: false, index: true
      t.integer    :twitter_user_id, null: false, index: true
      t.string     :uid, null: false, index: true

      t.timestamps null: false
    end
  end
end
