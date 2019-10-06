class TodoItemsController < ApplicationController
   before_action :set_event
   before_action :set_todo_list
   before_action :set_todo_item, except: [:create]

  def create
   @todo_item = @todo_list.todo_items.create(todo_item_params)
   redirect_to event_todo_list_path(@event, @todo_list)
  end

  def destroy
   # @todo_item = @todo_list.todo_items.find(params[:id])
   if @todo_item.destroy
    flash[:success] = "To do List item was deleted."
   else
    flash[:error] = "To do List item could not be deleted."
   end
   redirect_to event_todo_list_path(@event)
  end

  def complete
   @todo_item.update_attribute(:completed_at, Time.now)
   redirect_to event_todo_list_path(@event, @todo_list), notice: "Todo item completed"
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_todo_list
   @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
   @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def todo_item_params
   params[:todo_item].permit(:content, :todo_list_id, :event_id)
  end
end
