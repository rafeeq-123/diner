class DonationsController < ApplicationController
	def index
	end

	def new
		@donation = Donation.new
	end

	def create
		@donation.create
	end
end
