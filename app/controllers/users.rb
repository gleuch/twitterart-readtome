class Users < Application
  def new
    @user = User.new
    display @user
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect url(:login)
    else
      render :new
    end
  end
end