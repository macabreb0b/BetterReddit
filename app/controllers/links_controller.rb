class LinksController < ApplicationController
  # before_action :check_logged_in, only: [:create, :check_if_op]
  before_action :check_if_op, only: [:edit, :update, :destroy]

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def new
    @link = Link.new
    render :new
  end

  def show
    @link = Link.find(params[:id])
    @comments = @link.comments
    render :show
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to :back
  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :body, sub_ids: [])
    end

    def check_if_op
      @link =  Link.find(params[:id])
      unless @link.user_id == current_user.id
        redirect_to link_url(@link)
      end
    end
end
