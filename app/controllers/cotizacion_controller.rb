class CotizacionController < ApplicationController
  def new
  	x = ""
  	x = params[:tc][:tc] unless params[:tc].nil?
  	if x == "yes"
  		p "Cotizacionm"
  		@tc_tc = rand(1000000000000)
  		@cotizacion = Cotizacion.new(tc: @tc_tc, cliente: "", bodega:"", pago: "", cantidad: 0, descuento: 0)
  		@cotizacion.save!
  	end
  	@clientes = Cliente.all
  	@cotizacion = Cotizacion.last
  	render 'edit'
  	#producto = params[:producto]
  	#tc = params[:tc]
  	#@inventarios = []
  	#p "p" * 50
  	#if producto && Producto.find_by(tc: tc, upc: producto) != nil
  	#	p "*-"*100
  	#	inventario = Inventario.find_by(upc: producto)
  	#	producto = Producto.new(tc: tc, upc: producto, nombre: inventario.descripcion, cantidad: inventario.cantidad, precio: inventario.venta, bodega: inventario.bodega)
  	#	if producto.save
  	#		redirect_to new_cotizacion_path
  	#	else
  	#		render 'new'
  	#	end
  	#end
  end

  def create
  	@cotizacion = Cotizacion.new(cotizacion_params)

  	if @cotizacion.save
  		#flash[:success] = "Welcome to my app"
      #log_in(@)
  		redirect_to new_cotizacion_path
  	else
  		render 'new'
  	end
  end

  def update
  	cotizacion = Cotizacion.last
  	p "999999999999999999999999999"
  	p producto = params[:cotizacion][:producto][:producto]
  	p result = Producto.find_by(tc: cotizacion.tc, upc: producto) 
  		inventario = Inventario.find_by(upc: producto)
	  	if producto && result == nil && inventario
	  		
	  		producton = Producto.new(tc: cotizacion.tc, upc: producto, nombre: inventario.descripcion, cantidad: inventario.cantidad, precio: inventario.venta, bodega: inventario.bodega)
	  		if producton.save
	  			redirect_to new_cotizacion_path
	  		else
		  		render 'new'
		  	end
	  		product =  params.require(:cotizacion).require(:producto).permit(:producto)
	  	elsif producto == ""
	  		@cotizacion = Cotizacion.last
		    if @cotizacion.update_attributes(cotizacion_params)
		    p 	"Updateo"
		    	#flash[:success] = "Profile updated"
		    	#redirect_to new_cotizacion_path
		    else
		      render 'new'
		    end
	  	else
	  		p "Ninguno"
	  		redirect_to new_cotizacion_path
	  	end    
  end

  private
  	def cotizacion_params
  		params.require(:cotizacion).permit(:tc, :cliente, :bodega, :pago, :cantidad, :descuento)
  	end
end
