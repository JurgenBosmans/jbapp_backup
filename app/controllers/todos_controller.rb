class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :kopieer]

  def index
    @todos = current_user.todos.all
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  def create
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo lijst werd aangemaakt.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo geüpdate.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_path, notice: 'Todo lijst verwijderd.' }
      format.json { head :no_content }
    end
  end

  def kopieer
    @nieuwe_todo = Todo.new
    @nieuwe_todo.user_id=@todo.user_id
    @nieuwe_todo.naam = "(een copy van) " + @todo.naam
    @nieuwe_todo.beschrijving = @todo.beschrijving
    
    if @nieuwe_todo.save
      @todo.todo_items.each do |todo|
        @nieuwe_todo_item = TodoItem.new
        @nieuwe_todo_item.todo_id = @nieuwe_todo.id
        @nieuwe_todo_item.item = todo.item
        @nieuwe_todo_item.save
      end
    end
    
    
      redirect_to todo_path(@nieuwe_todo), notice: "Copy gemaakt van de lijst '" + @todo.naam.upcase + "', pas de omschrijving aan." 
    
    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:naam, :beschrijving, :user_id)
    end
end
