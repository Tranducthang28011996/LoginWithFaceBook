class IncomesController < ApplicationController
  def index
  
    @incomes=current_user.incomes
    # @categories=@incomes.cate
  end

  def new
  
     @categories = current_user.categories
     @income = current_user.incomes.new
  end

  def edit
    @categories =current_user.categories
    @income = current_user.incomes.find params[:id]
  end

  def update
    @income = current_user.incomes.find params[:id]

    @update_income = @income.update(income_params)
    redirect_to incomes_path

  end

  def create
    # @categories = current_user.categories
    
    @income = current_user.incomes.new(income_params)

    if @income.save
      redirect_to incomes_path
    else
      render :new
    end
  end

  def destroy
    @income =Income.find params[:id]
    @income.destroy
    respond_to do |format|
      format.html { redirect_to incomes_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
   end
  end
  private
  def income_params
    params.require(:income).permit :amount, category_ids: []
  end
end