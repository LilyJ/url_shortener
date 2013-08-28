get '/' do
  erb :index
end

post '/urls' do
  @url = params[:url]

  uri = URI(@url)

  begin
    res_code = Net::HTTP.get_response(uri).code    
  rescue
    res_code = "xxx"
    @error_msg = "Please enter a valid url"
    erb :index
  else
    if res_code == "200" || "301"
      Link.create(url: @url)
      erb :created_short_url
    else
      @error_msg = "Please enter a valid url"
      erb :index
    end 
  end  
    
end


get '/:short_url' do
  @link_obj = Link.find_by_short_url(params[:short_url])
  Link.increment_counter :visited, @link_obj.id

  @long_url = Link.find_by_short_url(params[:short_url]).url
  redirect @long_url
end
