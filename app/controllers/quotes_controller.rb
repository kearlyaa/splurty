class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").last
    @year = Time.new.strftime("%Y") 
  end
end
