 class Api::V1::ProjectsController < ApplicationController  

  def index
    projects = Project.order('created_at DESC')
    render json: { status: 'SUCCESS', message: 'Loaded projects', projects: projects },status: :ok
  end

  def create
    project = Project.new(proj_params)

    if project.save
      render json: {status: 'SUCCESS', message: 'Saved project', project: project},status: :ok
    else
      render json: {status: 'ERROR', message: 'Project not saved', errors: project.errors},status: :unprocesseble_entity
    end
  end

  def show
    if (params[:with_tasks])
      project = Project.find(params[:id])
      tasks = project.tasks
      #proj_json = ProjectSerializer.new(project).serialized_json
      #tasks_json = TaskSerializer.new(tasks).serialized_json
      #render json: {status: 'SUCCESS', message: 'Loaded projects with tasks', data: proj_json, include: tasks_json},status: :ok

      render json: {status: 'SUCCESS', message: 'Loaded projects with tasks', project: project, tasks: tasks},status: :ok
    else
      project = Project.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded project', project: project},status: :ok
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
      render json: {status: 'SUCCESS', message: 'Project updated', project: project},status: :ok
    else
      render json: {status: 'ERROR', message: 'Project not updated', project: project.errors},status: :unprocesseble_entity
    end
  end



  private
  def proj_params
    params.permit(:name, :description, :lifecycle, :funding)
  end

  
end