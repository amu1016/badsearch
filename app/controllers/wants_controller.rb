class WantsController < ApplicationController
  def edit
    @want = Want.find(params[:id])
  end

  def update
    @want = Want.find(params[:id])
    if @want.update(update_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def update_params
    params.require(:want).permit(:sex_id, age_ids: [], level_ids: [])
  end
end
