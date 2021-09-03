class EventsController < ApplicationController

  def index
    @events = Event.all 
  end

  def show
  end

  def new
    @event = Event.new
    render plain: render_to_string(partial: 'form_new', layout: false, locals: { event: @event })
  end

  def create
    @event = Event.new(params_event)
    if @event.save
      respond_to do |format|
        format.html { redirect_to events_path } 
        format.js  #create.js.erbを探してその中の処理を実行する
      end
    else
      respond_to do |format|
        format.js {render partial: "error" }
        #登録にエラーが起きたときはerror.js.erbを実行する
      end
    end
  end


  def edit
    @event = Event.find(params[:id])
    render plain: render_to_string(partial: 'form_edit', layout: false, locals: { event: @event })
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(params_event)
      respond_to do |format|
        format.html { redirect_to events_path } 
        format.js
      end
    else
      respond_to do |format|
        format.js {render partial: "error" }
      end
    end
  end

  def destroy
  end



  private
  def params_event
    params.require(:event).permit(:start, :end, :place)
  end
end
