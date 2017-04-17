module CostsHelper
	def first_day_of_month
	 cost_chart = current_user.costs
	 start_month = cost_chart.minimum(:created_at)
	 
	end

	def last_day_of_month
		cost_chart = current_user.costs
		end_month = cost_chart.maximum(:created_at)
	end

	def total_costs 
	arr= []
     cost_chart=current_user.costs
	 arr.push(cost_chart.where("?<= created_at AND created_at<=?",first_day_of_month,last_day_of_month).sum(:amount))
	 return arr
	end

	def each_category_costs
		
	end
end


