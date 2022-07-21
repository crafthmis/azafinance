class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :subscriber, foreign_key: { to_table: :users }
      t.references :subscribed_to, foreign_key: { to_table: :users }
      t.timestamps
      t.index [:subscriber_id, :subscribed_to_id], unique: true
    end
  end
end
