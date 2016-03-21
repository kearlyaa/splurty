class QuotesController < ApplicationController
  
  def index
    @quote = Quote.order("RANDOM()").last
    @year = Time.new.strftime("%Y") 
  end

  def new
    @quote = Quote.new
  end
end
