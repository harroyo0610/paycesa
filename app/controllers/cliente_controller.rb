class ClienteController < ApplicationController

  def index
  	@clientes = Cliente.all
  end

  def new
  	@cliente = Cliente.new
  end
  def create
  	@cliente = Cliente.new(cliente_params)

  	if @cliente.save
  		#flash[:success] = "Welcome to my app"
      #log_in(@)
  		redirect_to cliente_index_path
  	else
  		render 'new'
  	end
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update_attributes(cliente_params)
      #flash[:success] = "Profile updated"
      redirect_to cliente_index_path
    else
      render 'edit'
    end
  end

  def destroy
		Cliente.find(params[:id]).destroy
		#flash[:success] = "User deleted"
		redirect_to cliente_index_path
	end

  private
  	def cliente_params
  		params.require(:cliente).permit(:nombre, :telefono, :email, :direccion, :direccion_entrega)
  	end
end
