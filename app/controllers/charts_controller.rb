class ChartsController < ApplicationController
  include IncomesHelper
  include CostsHelper
  before_action :authenticate_user!
  def index
    cost_chart = current_user.costs
    # start_month = cost_chart.minimum(:created_at).month
    # end_month = cost_chart.maximum(:created_at).month
    arr= []
    cost_chart.each{|k| arr.push(k.created_at)}
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Total costs And Incomes Col")
      f.xAxis(:categories => arr )
      
      f.series(:name => "Costs", :yAxis => 0, :data => total_costs)
      f.series(:name => "Incomes", :yAxis => 1, :data => total_incomes)
      # byebug
      f.yAxis [
        {:title => {:text => "Costs", :margin => 70} },
        {:title => {:text => "Incomes"}, :opposite => true},
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"column"})
    end
    #########  income
    @chart5 = LazyHighCharts::HighChart.new('pie') do |f|
          f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
          series = {
                   :type=> 'pie',
                   :name=> 'Total',
                   :data=> [
                      ['Costs',   total_costs[0]],
                      ['Incomes', total_incomes[0]],
                   ]
          }
          f.series(series)
          f.options[:title][:text] = "Total costs And Incomes Pie"
          f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
          f.plot_options(:pie=>{
            :allowPointSelect=>true, 
            :cursor=>"pointer" , 
            :dataLabels=>{
              :enabled=>true,
              :color=>"black",
              :style=>{
                :font=>"13px Trebuchet MS, Verdana, sans-serif"
              }
            }
          })
    end
end
end
