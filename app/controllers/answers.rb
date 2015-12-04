#DISPLAY QUESTION FORM
# get '/answers/add' do
#   erb :"answer/add"
# end

# ADD ANSWER
post '/answers' do	
	# @user = current_user
	@answer = current_user.answers.new(comment: params[:comment], question_id: params[:question_id])
  if @answer.save
		redirect "/questions/#{@answer.question_id}"
		# redirect "/q/#{current_user.id}"
	else
		@error = question.errors.full_messages
		erb :"question/create"
	end
end



# CREATE QUESTION
post '/questions' do	
	@user = current_user
	question = current_user.questions.new(title: params[:title], body: params[:body])
  if question.save
		redirect "/questions/#{question.id}"
	else
		@error = question.errors.full_messages
		erb :"question/create"
	end
end