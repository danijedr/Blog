class Comment
	include Mongoid::Document
  	include Mongoid::Timestamps

  	field :value, type: Integer, default: 0
  	field :abusive, type: Boolean, default: false
  	field :body, type: String 

  	 validates_presence_of :body

  	 belongs_to :user
  	 belongs_to :post

  	 has_many :votes
	
	 def non_abusive
		update_attribute :abusive, false
	 end	
	
	 def mark_abusive
		update_attribute :abusive, true
	 end

end
