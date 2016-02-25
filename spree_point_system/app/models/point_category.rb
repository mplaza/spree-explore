require 'date'

class PointCategory < ActiveRecord::Base
	has_many :point_actions
	has_one :point_agreement

	def count_for_current_month
		currentMonth = Date.today.strftime("%Y-%m")
		currentMonth += '-01'
		firstOfMonth = DateTime.strptime(currentMonth, "%Y-%m-%d")
  		return self.point_actions.where("created_at >= ?", firstOfMonth).count
  	end

  	def cost_for_current_month
  		pointCost = self.point_agreement.cost_per_point
  		totalCost = pointCost * self.count_for_current_month
  		return totalCost
  	end
end
