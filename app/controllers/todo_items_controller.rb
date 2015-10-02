class TodoItemsController < ApplicationController
	before_action :set_todo
	before_action :set_todo_item, except: [:create]

	def create
		@todo_item = @todo.todo_items.create(todo_item_params)
		redirect_to @todo
	end

	def destroy
    	if @todo_item.destroy
      		flash[:success] = "Item uit todo lijst verwijderd."
		else
      		flash[:error] = "Kan het item niet verwijderen"
		end
		redirect_to @todo
	end

  	def afgewerkt
    	@todo_item.update_attribute(:afgewerkt, Time.now)
    	redirect_to @todo, notice: "Todo item volledig"
	end

	private
		def set_todo
			@todo = current_user.todos.find(params[:todo_id])
		end

		def set_todo_item
			@todo_item = @todo.todo_items.find(params[:id])
		end

		def todo_item_params
    		params[:todo_item].permit(:item)
		end
end
