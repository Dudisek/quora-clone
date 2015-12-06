include WillPaginate::Sinatra::Helpers

get '/' do

  @top_stories = Question.order(id: :desc).paginate(:page => params[:page], :per_page => 10)
  erb :"static/index"
end

