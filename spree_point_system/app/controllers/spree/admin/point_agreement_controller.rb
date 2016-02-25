class Spree::Admin::PointAgreementController < Spree::Admin::BaseController

	def index
		@agreements = PointAgreement.all
	end

	def payments
		@categories = PointCategory.all
	end

end