class CostsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@costs=current_user.costs
  end

  def new

  	@categories=current_user.categories
  	@cost = current_user.costs.new
  end

  def create

  	@cost = current_user.costs.new(cost_params)
  	if @cost.save
      redirect_to costs_path
    else
      render :new
    end
  end

  def edit
    @categories=current_user.categories
    @cost =current_user.costs.find params[:id]
  end

  def update
    @cost =current_user.costs.find params[:id]
    @cost_update=@cost.update(cost_params)
    redirect_to costs_path
  end

  def destroy
    @cost = current_user.costs.find params[:id]
    @cost.destroy
    redirect_to :back
  end
  private
  def cost_params
  	params.require(:cost).permit :amount , category_ids: []


  end
end
