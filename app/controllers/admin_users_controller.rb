class AdminUsersController < ApplicationController

  layout 'admin'
  before_action :confirm_logged_in

  def index
    @users = AdminUser.sorted
  end

  def new
    @user = AdminUser.new
  end

  def create
    @user = AdminUser.new(admin_params)    
    if @user.save
      flash[:notice] = "Succesfully created Admin"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @user = AdminUser.find(params[:id])
  end

  def update
    @user = AdminUser.find(params[:id])
    if @user.update_attributes(admin_params)
      flash[:notice] = "Succesfully updated Admin"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @user = AdminUser.find(params[:id])
  end

  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin successfuly deleted"
    redirect_to(:action => 'index')
  end

  private

  def admin_params
   params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
 end
end
