class LoginController < ApplicationController

  def index
  end

  def index_do
    form     = params[:form]
    usuario = Usuario.find_by_nome_and_senha(form[:login],form[:senha])
    if not usuario.nil?
        session[:usuario_id] = usuario.id
        redirect_to :controller => '/contatos', :action => 'index'
    else
      if usuario.nil?
        flash[:error] = "Usuario Não cadastrado"
      else
        flash[:error] = "Usuario Não tem Acesso"
      end
      redirect_to :controller => '/login', :action => 'index'
    end
  end
end
