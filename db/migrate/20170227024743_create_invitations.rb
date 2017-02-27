class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.references :team, foreign_key: true
      t.references :user
      t.string :email
      t.string :name
      t.string :authentication_token
      t.datetime :authentication_token_redeemed_at
      t.timestamps
    end
  end
end
