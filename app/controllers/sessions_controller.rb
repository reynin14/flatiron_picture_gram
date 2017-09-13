class SessionsController < ApplicationController
  def new
  end

 def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'Invalid email/password combination :('
      render :new
    end
  end

 def destroy
    session.delete :user_id
    redirect_to '/'
  end

end

# class SessionsController < ApplicationController
#   def new
#   end
#
#   def create
#     @user = User.find_by(username: params[:username])
#     return head(:forbidden) unless @user.authenticate(params[:password])
#     session[:user_id] = @user.id
#     redirect_to user_path(@user)
#   end
#
#   def destroy
#     session.delete :user_id
#     redirect_to '/'
#   end
#
# end
