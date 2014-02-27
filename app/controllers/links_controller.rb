class LinksController < ApplicationController
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
  end

  def new
    @link = Link.new
    render :new
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end

  def update
  end

  def link_params
    params.require(:link).permit(:title, :url, :body, sub_ids: [])
  end
end
