class CreateCheets < ActiveRecord::Migration[6.1]
  def change
    create_table :cheets do |t|
      t.column :message, :string, null: false, limit: 140
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
