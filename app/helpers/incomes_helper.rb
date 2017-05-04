require 'date'
module IncomesHelper
	def income_first_day_of_month
	 income_chart = current_user.incomes
	 income_chart.minimum(:created_at)
	 
	end

	def income_last_day_of_month
		income_chart = current_user.incomes
		income_chart.maximum(:created_at)

	end

	def total_incomes
		arr= []
     	income_chart=current_user.incomes
		
		first_day_of_month= income_chart.minimum(:created_at)
		last_day_of_month= income_chart.maximum(:created_at)
	 	
	 	arr.push(income_chart.where("?<= created_at AND created_at<=?",income_first_day_of_month, income_last_day_of_month).sum(:amount))
	 	
	 	return arr

		# return []
	end
end
 # Income.where("? < created_at AND created_at < ?", 1, 30).sum(:amount)
#   c.created_at.where("?< created_at.day AND created_at.day<?",1,30)
# c.select("amount").where("?< created_at AND created_at<?",1,30)
# > d=User.find(2).costs
