class CommentsController < ApplicationController

	def mark_as_not_abusive
		Comment.find(params[:id]).non_abusive
		Comment.find(params[:id]).save
		redirect_to action: :index
	end

	def vote_up
	
		votes_list = Comment.find(params[:id]).votes
		
		votes_list.each do |vlist|
			if vlist.user == current_user
				redirect_to action: :index
				return
			end
		end
		
		temp_vote = Vote.new
		temp_vote.user = current_user
		temp_vote.comment=Comment.find(params[:id])
		temp_vote.positive
		temp_vote.save
		redirect_to action: :index
	end

	def vote_down
		votes_list = Comment.find(params[:id]).votes

		votes_list.each do |vlist|
			if vlist.user == current_user
				redirect_to action: :index
				return 
			end
		end

		temp_vote = Vote.new
		temp_vote.user = current_user
                temp_vote.comment=Comment.find(params[:id])
		temp_vote.negative
                temp_vote.save
		redirect_to action: :index
	
	end
end
