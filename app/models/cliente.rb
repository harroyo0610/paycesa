class Cliente < ApplicationRecord
	validates :nombre, :telefono, :email, :direccion, :direccion_entrega,   presence: true
end
