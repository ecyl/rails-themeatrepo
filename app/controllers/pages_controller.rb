class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    unless current_user.nil?
      @role = current_user.role
      @user = User.find(current_user.id)


      @butcheries = @user.butcheries if @role == 'seller'
    end

    # include orders when done
  end

  def show

  end


end
