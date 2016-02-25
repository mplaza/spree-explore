require 'date'

class PointCategory < ActiveRecord::Base
	has_many :point_actions
	has_one :point_agreement

	def count_for_current_month

  end


end
