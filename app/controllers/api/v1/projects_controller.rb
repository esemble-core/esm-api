class Api::V1::ProjectsController < ApplicationController  

  def index
    projects = Project.order('created_at DESC')
    render json: { status: 'SUCCESS', message: 'Loaded projects', data: projects },status: :ok
  end

  def create
    project = Project.new(proj_params)

    if project.save
      render json: {status: 'SUCCESS', message: 'Saved user', data: project},status: :ok
    else
      render json: {status: 'ERROR', message: 'Project not saved', data: project.errors},status: :unprocesseble_entity
    end
  end

  def show
    project = Project.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded project', data: project},status: :ok
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



  private
  def proj_params
    params.permit(:name, :description, :lifecycle, :funding)
  end
end