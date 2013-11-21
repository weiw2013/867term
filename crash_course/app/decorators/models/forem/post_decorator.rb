Forem::Post.class_eval do
  attr_accessible :start_time, :length, :text, :reply_to_id 
  #validates :start_time, :presence => true
  #validates :length, :presence => true

end