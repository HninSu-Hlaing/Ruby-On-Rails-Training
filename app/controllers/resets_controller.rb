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
        flash[:notice] = 'If an account with the email is found, send email with reser password link'
    end
end