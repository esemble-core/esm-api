class Api::V1::TasksController < ApplicationController 
  
  def create
    project = Project.find(params[:project_id])
    task = project.tasks.create(task_params)
    if project.save
      render json: {status: 'SUCCESS', message: 'Saved task', data: task},status: :ok
    else
      render json: {status: 'ERROR', message: 'Task not saved', data: task.errors},status: :unprocesseble_entity
    end

  rescue ActiveRecord::RecordNotFound
    render json: {status: 'ERROR', message: 'Task could not be saved, parent project not found'},status: :unprocesseble_entity
  end


  def show
    task = Task.find(params[:id])
    users_working_on = task.users
    render json: {status: 'SUCCESS', message: 'Task found', data: task, include: users_working_on},status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: {status: 'ERROR', message: 'Task could not be found for that id'},status: :unprocesseble_entity
  end


  def user_working_on_task
    t = Task.find(params[:task_id])
    u = User.find(params[:user_id])
    t.users << u
    t.save
    render json: {status: 'SUCCESS', message: 'Saved user working on task'},status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: {status: 'ERROR', message: 'Task or User could be not found'},status: :unprocesseble_entity
  end

private
  def task_params
    params.permit(:name, :project_id)
  end

end
