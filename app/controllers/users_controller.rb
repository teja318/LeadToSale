class UsersController < ApplicationController

 def index
 @users = User.all
 end

 def new
  @user = User.new
 end

 def create
  @user = User.new(user_params)
  
  if @user.save
  redirect_to users_path, notice: "Successfully added user "
  else
  render action: "new"
  end
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


end
