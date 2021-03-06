class WantsController < ApplicationController

  def new
    @want = Want.new
  end

  def create
    @want = Want.new(want_params)
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
    if @want.update(want_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def want_params
    params.require(:want).permit(:sex_id,{ age_ids: []},{ level_ids: []}).merge(club_id: params[:club_id])
  end
end
