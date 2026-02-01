class TasksController < ApplicationController
  before_action :require_user

  def index
    @tasks = current_user.tasks.order(created_at: :desc)
  end

  def new
    @task = current_user.tasks.build
    @categories = current_user.categories
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Tarefa criada com sucesso!"
    else
      @categories = current_user.categories
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
    @categories = current_user.categories
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Tarefa atualizada com sucesso!"
    else
      @categories = current_user.categories
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "Tarefa removida!" }
      format.js   { render js: "alert('Tarefa removida com sucesso!'); window.location.reload();" }
    end
  end
  

  private

  def task_params
    params.require(:task).permit(:titulo, :descricao, :concluida, :prioridade, :category_id)
  end
end