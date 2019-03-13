class ActivitiesController < ApplicationController
    def upvote
		@post = Activity.find(params[:id])
		@post.upvote_by current_user
		respond_to do |format|
            format.html
            format.js do
                voting_partial = render_to_string(partial: "activities/voting.html", locals: {post: @post})
                render partial: 'upvote_downvote', locals: {partial_to_render: voting_partial, post: @post}
            end
    	end
    end
    
    def downvote
		@post = Activity.find(params[:id])
		@post.downvote_by current_user
		respond_to do |format|
	    	format.html
	    	format.js do
        		voting_partial = render_to_string(partial: "activities/voting.html", locals: {post: @post})
        		render partial: 'upvote_downvote', locals: {partial_to_render: voting_partial, post: @post}
      		end
    	end
	end

end
