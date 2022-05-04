class ResetsController < ApplicationController
    def new
    end
    def create
        @user = User.find_by(email:params[:email])
        if @user.present?
            #send email
            PasswordMailer.with(user:@user).reset.deliver_now
        end
        redirect_to root_path
        flash[:notice] = 'If an account with the email is found, send email with reset password link'
    end
    def edit
        @user = User.find_signed(params[:token],purpose:"password_reset")
        rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path,notice: "Your token has been expired.Please try again"
    end
    def update
        @user = User.find_signed(params[:token],purpose:"password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path,notice:"Your password was successfully reset.Please sign in"
        else 
            render :edit
        end
    end
    private
    def password_params
        params.require(:user).permit(:password)
    end
end