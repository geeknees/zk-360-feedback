class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization
  before_action :set_categories, only: [ :index ]
  before_action :set_user, only: [ :edit, :update, :destroy ]

  def index
    @users = @organization.users
  end

  def new
    @user = @organization.users.new
  end

  def create
    @user = @organization.users.new(user_params)
    if @user.save
      redirect_to users_path(@organization.name), notice: "User was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    # パスワードが空の場合、パスワード関連のパラメータを削除
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      redirect_to users_path(@organization.name), notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path(@organization.name), notice: "User was successfully deleted."
  end

  private

  def set_organization
    @organization = Organization.find_by!(name: params[:organization_name])
  end

  def set_categories
    @categories = @organization.categories
  end

  def set_user
    @user = @organization.users.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
  end
end
