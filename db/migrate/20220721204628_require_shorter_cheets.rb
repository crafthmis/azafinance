class RequireShorterCheets < ActiveRecord::Migration[6.1]
  def up
    Cheet.where('char_length(message) > 100').update_all("message = substring(message, 97) || '...'")
    change_column :cheets, :message, :string, limit: 100
  end
end
