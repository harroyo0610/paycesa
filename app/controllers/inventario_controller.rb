class InventarioController < ApplicationController
  def index
  	@inventarios = Inventario.all
  end

  def new
  	@inventario = Inventario.new
  end
  def create
  	@inventario = Inventario.new(params_inventario)

  	if @inventario.save
  		flash[:success] = "Welcome to my app"
      #log_in(@)
  		redirect_to inventario_index_path
  	else
  		render 'new'
  	end
  end
  def edit
    @inventario = Inventario.find(params[:id])
  end

  def update
    @inventario = Inventario.find(params[:id])
    if @inventario.update_attributes(params_inventario)
      #flash[:success] = "Profile updated"
      redirect_to inventario_index_path
    else
      render 'edit'
    end
  end

  def destroy
		Inventario.find(params[:id]).destroy
		#flash[:success] = "User deleted"
		redirect_to inventario_index_path
	end

  def show
  	tipo_inventario = params[:id]
  	@inventarios = Inventario.where(tipo: tipo_inventario)
    respond_to do |format|
      format.html
      format.csv{ send_data  @inventarios.to_csv  }
      format.xls{ send_data  @inventarios.to_csv(col_sep: "\t") }
    end
  end

  private 
  	def params_inventario
  		params.require(:inventario).permit(:upc, :tipo, :bodega, :modelo, :descripcion, :compra, :venta, :cantidad)
  	end
end
