class Vote 
	include Mongoid::Document
  	include Mongoid::Timestamps

	field :value, type: Integer

	belongs_to :user
	belongs_to :comment
 
	after_create :check_if_abusive

	def positive
		update_attribute :value, 1
	end

	def negative
		update_attribute :value, -1
	end

	def check_vote
		value
	end

	def check_if_abusive

		votes_list = self.comment.votes
		counter=0		

		votes_list.each do |vlist|
			counter = counter + 1 if vlist.check_vote == -1
		end

		self.comment.mark_abusive if counter == 3
	
	end
	

end
