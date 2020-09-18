class ItemsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = user.new(user_params)
    if @user.vilid?
      @user.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:first_name,:lasa_name,:first_furigana,:last_furigana,:birthday)
  end
end
