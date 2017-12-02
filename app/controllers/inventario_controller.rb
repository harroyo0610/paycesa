class InventarioController < ApplicationController
  def index
  end

  def new
  	@inventario = Inventario.new
  end
  def create
  	p params_inventario
  	@inventario = Inventario.new(params_inventario)

  	if @inventario.save
  		#flash[:success] = "Welcome to my app"
      #log_in(@)
  		redirect_to inventario_index_path
  	else
  		render 'new'
  	end
  end
  def show
  	p tipo_inventario = params[:id]
  	@inventarios = Inventario.where(tipo: tipo_inventario)
  end

  private 
  	def params_inventario
  		params.require(:inventario).permit(:upc, :tipo, :bodega, :modelo, :descripcion, :compra, :venta, :cantidad)
  	end
end
