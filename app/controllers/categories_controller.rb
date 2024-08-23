
class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization
  before_action :set_category, only: [ :show, :edit, :update, :destroy ]

  def index
    @categories = @organization.categories
  end

  def show
  end

  def new
    @category = @organization.categories.build
  end

  def create
    @category = @organization.categories.build(category_params)
    if @category.save
      redirect_to categories_path(@organization.name), notice: "Category was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path(@organization.name), notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path(@organization.name), notice: "Category was successfully deleted."
  end

  private

  def set_organization
    @organization = Organization.find_by!(name: params[:organization_name])
  end

  def set_category
    @category = @organization.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
