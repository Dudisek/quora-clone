get '/' do
  @top_stories = Question.order(id: :desc).limit(10)
  erb :"static/index"
end