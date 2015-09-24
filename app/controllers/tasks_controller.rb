class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      puts '*'*80
      p 'hello'
      redirect_to task_path(@task), notice: 'Task successfully created!'
    else
      render :action => :new
    end

  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    p '*'*80
    p params
    if @task.update(task_params)
      redirect_to task_path(@task), notice: 'Task successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed, :due_date)
  end

end
