class ChartsController < ApplicationController
  include IncomesHelper
  include CostsHelper
  def index

  
    # @chart = LazyHighCharts::HighChart.new('graph') do |f|
    #   f.title({ :text=>"Combination chart"})
    #   f.options[:xAxis][:categories] = ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
    #   f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
    #   f.series(:type=> 'column',:name=> 'Jane',:data=> [3, 2, 1, 3, 4])
    #   f.series(:type=> 'column',:name=> 'John',:data=> [2, 3, 5, 7, 6])
    #   f.series(:type=> 'column', :name=> 'Joe',:data=> [4, 3, 3, 9, 0])
    #   f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
    #   f.series(:type=> 'pie',:name=> 'Total consumption', 
    #     :data=> [
    #       {:name=> 'Jane', :y=> 13, :color=> 'red'}, 
    #       {:name=> 'John', :y=> 23,:color=> 'green'},
    #       {:name=> 'Joe', :y=> 19,:color=> 'blue'}
    #     ],
    #     :center=> [100, 80], :size=> 100, :showInLegend=> false)
    # end

    cost_chart = current_user.costs
    start_month = cost_chart.minimum(:created_at).month
    end_month = cost_chart.maximum(:created_at).month

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "LazyHighCharts")
      f.xAxis(:categories => (start_month..end_month).to_a)
      f.series(:name => "Costs", :yAxis => 0, :data => total_costs)
      f.series(:name => "Incomes", :yAxis => 1, :data => total_incomes)

      f.yAxis [
        {:title => {:text => "Costs", :margin => 70} },
        {:title => {:text => "Incomes"}, :opposite => true},
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"column"})
    end

    # @chart3 = LazyHighCharts::HighChart.new('pie') do |f|
    #       f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
    #       series = {
    #                :type=> 'pie',
    #                :name=> 'Browser share',
    #                :data=> [
    #                   ['Firefox',   total_costs[0]],
    #                   ['IE',       total_incomes[0]],
    #                   {
    #                      :name=> 'Chrome',    
    #                      :y=> 12.8,
    #                      :sliced=> true,
    #                      :selected=> true
    #                   },
    #                   ['Safari',    8.5],
    #                   ['Opera',     6.2],
    #                   ['Others',   0.7]
    #                ]
    #       }
    #       f.series(series)
    #       f.options[:title][:text] = "THA PIE"
    #       f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
    #       f.plot_options(:pie=>{
    #         :allowPointSelect=>true, 
    #         :cursor=>"pointer" , 
    #         :dataLabels=>{
    #           :enabled=>true,
    #           :color=>"black",
    #           :style=>{
    #             :font=>"13px Trebuchet MS, Verdana, sans-serif"
    #           }
    #         }
    #       })
    # end

    # @chart4 = LazyHighCharts::HighChart.new('column') do |f|
    #   f.series(:name=>'Costs',:data=> total_costs)
    #   f.series(:name=>'Incomes',:data=>total_incomes )     
    #   f.title({ :text=>"example test title from controller"})
    #   f.options[:chart][:defaultSeriesType] = "column"
    #   f.plot_options({:column=>{:stacking=>"percent"}})
    # end
end
end
