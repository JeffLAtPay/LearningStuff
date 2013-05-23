Stats::Admin.controllers :transactions do
  get :index do
    @title = "Transactions"
    @transactions = Transaction.all
    render 'transactions/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'transaction')
    @transaction = Transaction.new
    render 'transactions/new'
  end

  post :create do
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save
      @title = pat(:create_title, :model => "transaction #{@transaction.id}")
      flash[:success] = pat(:create_success, :model => 'Transaction')
      params[:save_and_continue] ? redirect(url(:transactions, :index)) : redirect(url(:transactions, :edit, :id => @transaction.id))
    else
      @title = pat(:create_title, :model => 'transaction')
      flash.now[:error] = pat(:create_error, :model => 'transaction')
      render 'transactions/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "transaction #{params[:id]}")
    @transaction = Transaction.find(params[:id])
    if @transaction
      render 'transactions/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'transaction', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "transaction #{params[:id]}")
    @transaction = Transaction.find(params[:id])
    if @transaction
      if @transaction.update_attributes(params[:transaction])
        flash[:success] = pat(:update_success, :model => 'Transaction', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:transactions, :index)) :
          redirect(url(:transactions, :edit, :id => @transaction.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'transaction')
        render 'transactions/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'transaction', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Transactions"
    transaction = Transaction.find(params[:id])
    if transaction
      if transaction.destroy
        flash[:success] = pat(:delete_success, :model => 'Transaction', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'transaction')
      end
      redirect url(:transactions, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'transaction', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Transactions"
    unless params[:transaction_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'transaction')
      redirect(url(:transactions, :index))
    end
    ids = params[:transaction_ids].split(',').map(&:strip).map(&:to_i)
    transactions = Transaction.find(ids)
    
    if Transaction.destroy transactions
    
      flash[:success] = pat(:destroy_many_success, :model => 'Transactions', :ids => "#{ids.to_sentence}")
    end
    redirect url(:transactions, :index)
  end
end
