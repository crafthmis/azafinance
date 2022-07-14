class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.column :email, :text, null: false
      t.timestamps
    end
  end
end
