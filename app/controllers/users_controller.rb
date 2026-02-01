class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # loga o usuario automaticamente apos o cadastro
      redirect_to root_path, notice: "Bem-vindo ao DailyFlow, #{@user.nome}! Conta criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nome, :email, :password, :password_confirmation)
  end
end