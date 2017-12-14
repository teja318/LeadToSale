class CustomersController < ApplicationController
	def index
		@customers = current_user.customers
		#@customers = Customer.all
    end
end
