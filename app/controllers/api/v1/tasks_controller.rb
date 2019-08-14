class Api::V1::TasksController < ApplicationController 
  
  def create
    project = Project.find(params[:project_id])
    task = project.tasks.create(task_params)
    if project.save
      render json: {status: 'SUCCESS', message: 'Saved task', task: task},status: :ok
    else
      render json: {status: 'ERROR', message: 'Task not saved', task: task.errors},status: :unprocesseble_entity
    end

  rescue ActiveRecord::RecordNotFound
    render json: {status: 'ERROR', message: 'Task could not be saved, parent project not found'},status: :unprocesseble_entity
  end


  def set_completed
    task = Task.find(params[:id])
    #TODO: check that there is a verified completion event?
    task.done = true
    task.save
    render json: {status: 'SUCCESS', message: 'Task set as complete', task: task},status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: {status: 'ERROR', message: 'Task could not be updated, task not found'},status: :unprocesseble_entity
  end


  def show
    task = Task.find(params[:id])
    users_working_on = task.users
    token_fundings = task.task_fundings
    events = task.events.includes(:task_event_verifications)
    render json: {status: 'SUCCESS', message: 'Task found', task: task, users_working_on: users_working_on, task_fundings: token_fundings, events: events.to_json( :include => [:task_event_verifications] )},status: :ok
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


  def create_task_funding
    t = Task.find(params[:task_id])
    t.task_fundings.create(task_funding_params)
    t.save
    render json: {status: 'SUCCESS', message: 'Task funding saved on tasks'},status: :ok

  rescue ActiveRecord::RecordNotFound
    render json: {status: 'ERROR', message: 'Task or User could be not found'},status: :unprocesseble_entity
  end 


  def create_task_event
    t = Task.find(params[:task_id])
    event = t.verifiable_task_events.create(task_event_params)
    t.save
    render json: {status: 'SUCCESS', message: 'Task event saved on tasks', event: event},status: :ok

  rescue ActiveRecord::RecordNotFound
    render json: {status: 'ERROR', message: 'Task could be not found to add event to'},status: :unprocesseble_entity
  end 


  def create_event_verification
    te = VerifiableTaskEvent.find(params[:verifiable_task_event_id])
    u = User.find(params[:user_id])
    ev = te.task_event_verifications.create(event_verification_params)
    te.save
    render json: {status: 'SUCCESS', message: 'Task event verification saved on event', event_verification: ev},status: :ok

  rescue ActiveRecord::RecordNotFound
    render json: {status: 'ERROR', message: 'User of TaskEvent could be not found to add verification to'},status: :unprocesseble_entity
  end


  def task_event_types
    et = EventType.all
    render json: {status: 'SUCCESS', message: 'Task event types', task_event_types: et},status: :ok
  end


private
  def task_params
    params.permit(:name, :project_id)
  end

  def task_funding_params
    params.permit(:token_address, :token_name, :token_symbol, :amount, :task_id)
  end

  def task_event_params
    params.permit(:attachment_link_text, :event_type_id, :task_id)
  end

  def event_verification_params
    params.permit(:verifiable_task_event_id, :user_id, :comment)
  end
end
