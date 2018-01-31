class TodosController < ApplicationController
    
    before_action :set_todo, only: [:edit, :show, :update, :destroy]
    
    def new
        @todo = Todo.new
    end 
    
    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            flash[:notice] = "Todo was created successfully!"
            redirect_to todo_path(@todo) #this @todo is from the path, it redirects to todos#show
        else
            render 'new'
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @todo.update(todo_params)
            flash[:notice] = "Todo was successfully updated!"
            redirect_to(@todo)
        else
            render 'edit'
        end
    end
    
    def index
       @todos = Todo.all 
    end
    
    def destroy
       @todo.destroy
       flash[:notice] = "Todo was successfully deleted!"
       redirect_to todos_path
    end
    
    private
        
        def set_todo
           @todo = Todo.find(params[:id]) 
        end
        
        def todo_params
            params.require(:todo).permit(:name, :description)
        end
    
end