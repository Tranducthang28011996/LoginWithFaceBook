require 'date'
module IncomesHelper
	def first_day_of_month
	 income_chart = current_user.incomes
	 start_month = income_chart.minimum(:created_at)
	 
	end

	def last_day_of_month
		income_chart = current_user.incomes
		end_month = income_chart.maximum(:created_at)
	end

	def total_incomes 
	arr= []
     income_chart=current_user.incomes
	 arr.push(income_chart.where("?<= created_at AND created_at<=?",first_day_of_month,last_day_of_month).sum(:amount))
	 return arr

		# return []
	end
end
 # Income.where("? < created_at AND created_at < ?", 1, 30).sum(:amount)
#   c.created_at.where("?< created_at.day AND created_at.day<?",1,30)
# c.select("amount").where("?< created_at AND created_at<?",1,30)
# > d=User.find(2).costs
