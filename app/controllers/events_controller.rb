class EventsController < ApplicationController
  expose(:events){ Event.all }
  expose(:event){
    if params[:action] == 'new'
      Event.new()
    elsif params[:action] == 'create'
      Event.new(params[:event])
    elsif params[:action] == 'show' || params[:action] == 'edit'
      Event.find(params[:id])
    end
  }
  def new
  end
  def show
  end
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: events }
    end
  end
  def create
    if params[:event][:from_date].empty?
      params[:event][:from_date] = Date.today
    end
    if params[:event][:to_date].empty?
      params[:event][:to_date] = Date.today
    end
    if params[:event][:is_all_day] == '0'
      if params[:event][:from_time].empty?
        params[:event][:from_time] = Time.now.beginning_of_day
      end
      if params[:event][:to_time].empty?
        params[:event][:to_time] = Time.now.end_of_day
      end
    end

    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, :notice => 'El evento fue creado.' }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
 


  def update
    e = Event.find(params[:id])
    e.update_attributes(params[:event])
    flash[:notice] = 'Evento actualizado'
    redirect_to calendars_path
  end
  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to calendars_path
  end
end

