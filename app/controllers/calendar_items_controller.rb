class CalendarItemsController < ApplicationController

  def index
    @calendar_items = CalendarItem.all
  end

  def new
    @calendar_item = CalendarItem.new
  end

  def create
    @calendar_item = CalendarItem.new(permitted_params)
    @calendar_item.save
    redirect_to @calendar_item
  end

  def show
    @id = params[:id]
    @calendar_item = CalendarItem.find(@id)
  end

  def edit
    @calendar_item = CalendarItem.find(params[:id])
  end

  def update
    calendar_item = CalendarItem.find(params[:id])
    calendar_item.update(permitted_params)
    redirect_to calendar_item_path(calendar_item)
  end

  def destroy
    @calendar_item = CalendarItem.find(params[:id])
    @calendar_item.destroy
    redirect_to calendar_items_path
  end

  private
  def permitted_params
    params.require(:calendar_item).permit(:title, :body, :start_time, :end_time)
  end

end
