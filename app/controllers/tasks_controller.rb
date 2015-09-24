class TasksController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @tasks = Task.where(project_id: params[:project_id])
    # binding.pry
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task[:project_id] = params[:project_id]
    @project = Project.find(params[:project_id])
    if @task.save
      puts '*'*80
      p 'hello'
      redirect_to project_tasks_path(@project), notice: 'Task successfully created!'
    else
      render :action => :new
    end

  end

  def show
    @task = Task.where(id: params[:id], project_id: params[:project_id])
  end

  def edit
    @task = Task.where(id: params[:id], project_id: params[:project_id])
    # @task = Task.find(params[:id])
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
    params.require(:task).permit(:description, :completed, :due_date, :project_id)
  end

end
