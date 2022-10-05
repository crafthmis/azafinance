class RequireShorterCheets < ActiveRecord::Migration[6.1]
  def up
      add_column :cheets, :message_short, :string, limit: 100
      cheets = Cheet.where('char_length(message) > 100')
	  cheets.each do |p|
	    new_msg = p.message; 
	    p.update('message_short = ',new_msg[1,97]);
	  
	  cheets2 = Cheet.where('char_length(message) > 100')
        cheets2.each do |q|
	    new_msg2 = q.message; 
	    p.update('message_short = ',new_msg2);		
	  remove :cheets :message
	  rename :cheets :message_short, :message 
  end
end
