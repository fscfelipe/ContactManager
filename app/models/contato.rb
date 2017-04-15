require 'aws-sdk'

class Contato < ActiveRecord::Base
	belongs_to :user
	def imgURL
		"foto aqui"
	end


end
