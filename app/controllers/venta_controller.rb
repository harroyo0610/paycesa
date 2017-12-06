class VentaController < ApplicationController
  def new
  	x = ""
  	x = params[:tc][:tc] unless params[:tc].nil?
  	if x == "yes"
  		@tc_tc = rand(1000000000000)
  		@venta = Ventum.new(tc: @tc_tc, cliente: "", bodega:"", pago: "", cantidad: 0, descuento: 0)
  		@venta.save!
  	end
  	@clientes = Cliente.all
  	@venta = Ventum.last
  	render 'edit'
  end

  def create
  	@venta = Ventum.new(venta_params)

  	if @venta.save
  		#flash[:success] = "Welcome to my app"
      #log_in(@)
  		redirect_to new_ventum_path
  	else
  		render 'new'
  	end
  end

  def update
  	venta = Ventum.last
		producto = params[:venta][:producto][:producto] unless params[:venta].nil?
		result = Producto.find_by(tc: venta.tc, upc: producto) 
		inventario = Inventario.find_by(upc: producto)
	  	if producto && result == nil && inventario
	  		
	  		producton = Producto.new(tc: venta.tc, upc: producto, nombre: venta.descripcion, cantidad: venta.cantidad, precio: venta.venta, bodega: venta.bodega)
	  		if producton.save
	  			redirect_to new_ventum_path
	  		else
		  		render 'new'
		  	end
	  		product =  params.require(:venta).require(:producto).permit(:producto)
	  	elsif producto == ""
	  		@venta = Ventum.last
		    if @venta.update_attributes(venta_params)
		    	#flash[:success] = "Profile updated"
		    	#redirect_to new_cotizacion_path
		    else
		      render 'new'
		    end
	  	else
	  		redirect_to new_ventum_path
	  	end    
  end

  private
  	def venta_params
  		params.require(:venta).permit(:tc, :cliente, :bodega, :pago, :cantidad, :descuento)
  	end
end
