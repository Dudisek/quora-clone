# ADD ANSWER
post '/answers' do	
	# @user = current_user
	@answer = current_user.answers.new(comment: params[:comment], question_id: params[:question_id])
  if @answer.save
		redirect "/questions/#{@answer.question_id}"
		# redirect "/q/#{current_user.id}"
	else
		@error = "Please type your answer first."
		redirect "/questions/#{@answer.question_id}?errors=#{@error}"
	end
		# /users/login?errors=#{@errors}
end