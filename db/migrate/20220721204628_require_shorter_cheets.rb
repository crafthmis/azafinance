class RequireShorterCheets < ActiveRecord::Migration[6.1]
  def up
      add_column :cheets, :message_short, :string, limit: 100
      Cheet.where('char_length(message) > 100').update_all("message_short= substring(message, 97)||'...'")
  end
end
