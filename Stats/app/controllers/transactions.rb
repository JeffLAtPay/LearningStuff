Stats::App.controllers :transactions do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :index do
    @transactions = Transaction.all(:order => 'created_at desc')
    render 'transactions/index'
  end

  get :show, :with => :id do
    @transaction = Transaction.find_by_id(params[:id])
    render 'transactions/show'
  end

end
