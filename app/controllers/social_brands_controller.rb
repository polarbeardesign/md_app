class SocialBrandsController < ApplicationController
  before_filter :set_social_brand, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @social_brands = SocialBrand.all
    respond_with(@social_brands)
  end

  def show
    respond_with(@social_brand)
  end

  def new
    @social_brand = SocialBrand.new
    respond_with(@social_brand)
  end

  def edit
  end

  def create
    @social_brand = SocialBrand.new(params[:social_brand])
    @social_brand.save
    respond_with(@social_brand)
  end

  def update
    @social_brand.update_attributes(params[:social_brand])
    respond_with(@social_brand)
  end

  def destroy
    @social_brand.destroy
    respond_with(@social_brand)
  end

  private
    def set_social_brand
      @social_brand = SocialBrand.find(params[:id])
    end
end
