class PasswordsController < ApplicationController
    # allows only logged in users
    before_action :require_user_logged_in!
    def edit; end
    
    def create
      @user = User.find_by(email: params[:email])
      if @user.present?
        # send mail
        PasswordMailer.with(user: @user).reset.deliver_later
        # deliver_later is provided by ActiveJob
      end
      redirect_to root_path, notice: 'Please check your email to reset the password'
    end

    def update
      # update user password
      if Current.user.update(password_params)
        redirect_to root_path, notice: 'Password Updated'
      else
        render :edit
      end
    end
    private
    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
  end