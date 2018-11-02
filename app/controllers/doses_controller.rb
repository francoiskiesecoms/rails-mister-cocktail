class DosesController < ApplicationController
  def index
  end


  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.create(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.destroy(params[:id])
    redirect_to cocktail_path(@cocktail)
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
