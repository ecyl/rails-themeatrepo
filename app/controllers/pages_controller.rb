class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user_role
  def home
    @role = current_user.role
    @user_id = 11
    @user = User.find(@user_id)

    @butcheries = @user.butcheries if @role == 'seller'

    # include orders when done
  end

  # def show

  # end



  private

  def set_user_role
    @role = current_user.role
  end

end
