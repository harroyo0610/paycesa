class Inventario < ApplicationRecord

	def self.to_csv(options = {})
			p "self" * 50
			CSV.generate(options) do |csv|
				csv << column_names
				all.each do |i|
					csv << i.attributes.values_at(*column_names)
				end
			end
	end

end
