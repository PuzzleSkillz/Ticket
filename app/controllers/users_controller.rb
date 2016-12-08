class UsersController < ApplicationController

  # before_action :find_item, only: [:new, :create]
  before_action :check_if_admin, only: [ :show, :edit, :update, :destroy]
  def index
    if user_signed_in? && current_user.admin == true
      redirect_to admin_index_path
    end
  end

  # /tickets/1 GET
  def show
    if user_signed_in?
  	  @user = User.where(id: params[:id]).first
      render_404 unless @user
    else
      redirect_to new_user_session_path
    end
  end

  # /tickets/new GET
  def new
    @user = User.new
  end

  # /tickets POST
  def create
  	@user = User.create(user_ed_params)
  	if @user.errors.empty?
  	  redirect_to users_path(@user)
  	else
  	  render "new"
  	end
  end

  # /tickets/1/edit GET
  def edit
  end

  # /user/1 PUT
  def update
  	@user.update_attributes(user_ed_params)
  	if @user.errors.empty?
  	  redirect_to users_path(@user)
  	else
  	  render "edit"
  	end
  end

  # /tickets/1 DELETE
  def destroy
  	@user.destroy
    redirect_to action: "index"
  end

  private

  # def find_item
  # 	@user = User.find(params[:id])
  #   render_404 unless @user
  # end

  def user_ed_params
  	params.require(:user).permit(:email, :login, :company_name, :company_name, :contact_fio, :telephone, :site_name, :password, :password_confirmation, :admin)
  end

  def check_if_admin
  	@user = User.find(params[:id])
  	# @user = User.where(id: params [:id])
    render_404 unless @user
  	if user_signed_in?
      render text: "Acces denied", status: 403 unless current_user.admin == true
    end
  end

end
