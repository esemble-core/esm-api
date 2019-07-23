class Api::V1::ProjectsController < ApplicationController  

  def index
    projects = Project.order('created_at DESC')
    render json: { status: 'SUCCESS', message: 'Loaded projects', data: projects },status: :ok
  end

  def create
    project = Project.new(proj_params)

    if project.save
      render json: {status: 'SUCCESS', message: 'Saved project', data: project},status: :ok
    else
      render json: {status: 'ERROR', message: 'Project not saved', data: project.errors},status: :unprocesseble_entity
    end
  end

  def show
    if (params[:with_tasks])
      project = Project.find(params[:id])
      tasks = project.tasks
      #proj_json = ProjectSerializer.new(project).serialized_json
      #tasks_json = TaskSerializer.new(tasks).serialized_json
      #render json: {status: 'SUCCESS', message: 'Loaded projects with tasks', data: proj_json, include: tasks_json},status: :ok

      render json: {status: 'SUCCESS', message: 'Loaded projects with tasks', data: project, include: tasks},status: :ok
    else
      project = Project.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded project', data: project},status: :ok
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    render json: {status: 'SUCCESS', message: 'Deleted project'},status: :no_content
  end


  def update
    project = Project.find(params[:id])

    if (project.update_attributes(proj_params))
      render json: {status: 'SUCCESS', message: 'Project updated', data: project},status: :ok
    else
      render json: {status: 'ERROR', message: 'Project not updated', data: project.errors},status: :unprocesseble_entity
    end
  end


  def create_task
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


  private
  def proj_params
    params.permit(:name, :description, :lifecycle, :funding)
  end

  def task_params
    params.permit(:name, :project_id)
  end
end