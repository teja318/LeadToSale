class UsersController < ApplicationController

  
  load_and_authorize_resource
 def index
 @users = User.all
 @user = User.new
 end

 def new
  @user = User.new
 end

 def create
  @user = User.new(user_params)
  respond_to do |format|
   if @user.save
    format.html { redirect_to users_path, notice: 'user was successfully created.' }
        format.js
      else
        format.js
   end
  end
  # if @user.save
  # redirect_to users_path, notice: "Successfully added user "
  # else
  # render action: "new"
  # end
 end

 def edit
  @user = User.find(params[:id])
 end

 def show
  @user = User.find(params[:id])
 end

 def update
  @user = User.find(params[:id])
  if @user.update_attributes(user_params)
  redirect_to user_path(@user.id), notice: "Successfully updated user "
  else
  render action: "edit"
  end
 end

 def destroy
 @user = User.find(params[:id])
 @user.destroy
 redirect_to users_path,notice: "Successfully updated user "
 end

  private
 def user_params
  params[:user].permit(:full_name, :email, :phone, :role_id,:password, :password_confirmation) 
 end

 

end
