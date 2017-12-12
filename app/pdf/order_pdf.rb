class OrderPdf < Prawn::Document
	def initialize(cotizacion)
		super(page_size: "LETTER", margin: 1)
		font "Helvetica"
		font_size 12
		@cotizacion = cotizacion
		productos = Producto.where(tc: @cotizacion.tc)
		 #fondo
  		image "public/images/fondo.png", :at => [20,800], :width => 450 
  		draw_text "Cotización", :at => [220,650], :size => 28
		draw_text "#{@cotizacion.tc}", :at => [420,740]
		draw_text "#{@cotizacion.created_at.to_s[0..9]}", :at => [430,700]
		draw_text "#{@cotizacion.cliente}", :at => [100,600]
		draw_text "#{@cotizacion.bodega.capitalize}", :at => [100,580]
		draw_text "#{@cotizacion.pago.capitalize}", :at => [100,560]

		y = 450
		suma = 0
		productos.each do |item|
			draw_text "#{item.upc}", :at => [50,y]
			draw_text "#{item.nombre}", :at => [150,y]
			draw_text "$#{item.precio}", :at => [450,y]
			y = y + 20
			p suma = suma + item.precio 
		end
		subtotal = (suma * @cotizacion.cantidad).round(2)
		descuento = (((suma*@cotizacion.cantidad) / 100 ) * @cotizacion.descuento).round(2)
		total = ((subtotal-descuento) * 1.16).round(2)
		draw_text "$ #{subtotal}   MXN", :at => [500,200]
		draw_text "$ #{descuento}   MXN", :at => [500,180]
		draw_text "16%", :at => [500,160]
		draw_text "$ #{total}   MXN", :at => [500,140]
		draw_text "#{total.to_words.upcase} PESOS", :at => [100,140]
		#text "Prodcutos: #{productos.each { |producto| producto.upc }} "		
	end

	def place_image(img,x,y,w,h)
		image "public/images/#{img}.png", at: [x.send(:mm), [790-y.send(:mm)]], width: w.send(:mm), heigth: h.send(:mm)
	end
end


	