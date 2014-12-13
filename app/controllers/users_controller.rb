class UsersController < ApplicationController
  

  def new
    @usuario = User.new;
    authorize! :new, @usuario , :message => "Acceso denegado"
  end

  def index
    @usuario=User.all.paginate(:page => params[:page], :per_page => 5);
    authorize! :index, @usuario , :message => "Es necesario registrarse para completar la accion"
  end

  def update
    @usuario = User.find(params[:id])
    @usuario.update(params.require(:user).permit([:nombre, :apellido, :nick, :contrasena, :correo, :telefono, :sexo, :foto, :role]))
    if @usuario.save
      redirect_to @usuario, :notice => "Usuario editado exitosamente"
    else
      redirect_to :back, :notice => "Error al editar usuario"
    end
    authorize! :update, @usuario , :message => "Es necesario registrarse para completar la accion"
  end

  def show
    @usuario=User.find(params[:id])
    authorize! :show, @usuario , :message => "Es necesario registrarse para completar la accion"
  end

  def edit
    @usuario=User.find(params[:id])
    authorize! :edit, @usuario , :message => "Es necesario registrarse para completar la accion"

  end

  def create
    @usuario = User.create(params.require(:user).permit([:nombre, :apellido, :telefono, :correo, :nick, :contrasena,:foto, :role]))
    if @usuario.save
      redirect_to @usuario, :notice => "Usuario creado exitosamente"
    else
      redirect_to :back, :notice => "Error al creado usuario"
    end
    authorize! :create, @usuario , :message => "Acceso denegado"
  end

  def destroy
    @usuario=User.find(params[:id])
    t=@usuario
    t.destroy
    redirect_to users_path
    authorize! :destroy, @usuario , :message => "Es necesario registrarse para completar la accion"
  end
end
