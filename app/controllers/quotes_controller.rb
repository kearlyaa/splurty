class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").last
  end
end
