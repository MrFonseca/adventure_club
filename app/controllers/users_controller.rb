class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @roles = User.roles
  end

  def create
    @user = User.new(user_params)
    @roles = User.roles
    if @user.save
      redirect_to users_path
      flash[:success] = "Usuário criado"
    else
      render "new"
      flash[:danger] = "Não foi possível criar esse usuário"
    end
  end

  def edit
    @user = User.find(params[:id])
    @roles = User.roles
  end

  def update
    @user = User.find(params[:id])
    @roles = User.roles
    if @user.update(user_params)
      flash[:success] = "Usuário editado"
      redirect_to users_path
    else
      flash[:danger] = "Não foi possível editar esse usuário"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Usuário excluído"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user)
          .permit(
            :email,
            :password,
            :password_confirmation,
            :role,
            :registration_date
          )
  end
end
