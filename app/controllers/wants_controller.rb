class WantsController < ApplicationController

  def new
    @want = Want.new
  end

  def create
    @want = Want.new(sex_id: params[:sex_id].to_i, age_id: params[:age_id], level_id: params[:level_id],club_id: params[:club_id])
    if @want.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @want = Want.find(params[:id])
  end

  def update
    @want = Want.find(params[:id])
    if @want.update(sex_id: params[:sex_id].to_i, age_id: params[:age_id], level_id: params[:level_id],club_id: params[:club_id])
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def want_params
    params.require(:want).permit(:sex_id,{ age_id: []},{ level_id: []}).merge(club_id: params[:club_id])
  end
end
