class OrderPdf < Prawn::Document
	def initialize(cotizacion)
		@cotizacion = cotizacion
		super(top_margin: 70)
		p "pdf" * 100
		p @cotizacion
		text "Hello amigui #{@cotizacion.tc}"		
	end
end
