class SocialLinksController < ApplicationController
  before_filter :set_social_link, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @social_links = SocialLink.all
    respond_with(@social_links)
  end

  def show
    respond_with(@social_link)
  end

  def new
    @social_link = SocialLink.new
    respond_with(@social_link)
  end

  def edit
  end

  def create
    @social_link = SocialLink.new(params[:social_link])
    @social_link.save
    respond_with(@social_link)
  end

  def update
    @social_link.update_attributes(params[:social_link])
    respond_with(@social_link)
  end

  def destroy
    @social_link.destroy
    respond_with(@social_link)
  end

  private
    def set_social_link
      @social_link = SocialLink.find(params[:id])
    end
end
