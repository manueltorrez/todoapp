class TodosController < ApplicationController
    
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
        @todo = Todo.find(params[:id])
    end
    
    def edit
        @todo = Todo.find(params[:id])
    end
    
    def update
        @todo = Todo.find(params[:id])
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
       @todo = Todo.find(params[:id])
       @todo.destroy
       flash[:notice] = "Todo was successfully deleted!"
       redirect_to todos_path
    end
    
    private
        
        def todo_params
            params.require(:todo).permit(:name, :description)
        end
    
end