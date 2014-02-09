class Comment
<<<<<<< HEAD
	include Mongoid::Document
  	include Mongoid::Timestamps

  	field :value, type: Integer, default: 0
  	field :abusive, type: Boolean, default: false
  	field :body, type: String 

  	 validates_presence_of :body

  	 belongs_to :user
  	 belongs_to :post


	end
=======
end
>>>>>>> e222d25e8246153ff10b6872742a333fe79e55c1
