class SubsController < ApplicationController
  before_action :check_if_op, only: [:edit, :update]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    links = @sub.links.new(link_params)
    links.each { |link| link.user_id = current_user.id }
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def destroy
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def sub_params
    params.require(:sub).permit(:name)
  end

  def link_params
    params.permit(:links => [:title, :url, :body]).require(:links).values
          .reject { |data| data.values.all?(&:blank?) }
  end

  def check_if_op
    @link =  Link.find(params[:id])
    unless @link.user_id == current_user.id
      redirect_to link_url(@link)
    end
  end
end
