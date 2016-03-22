class QuotesController < ApplicationController
  
  def index
    @quote = Quote.order("RANDOM()").last
    @year = Time.new.strftime("%Y") 
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid'
      redirect_to new_quote_path
      return
    end

    redirect_to root_path
  end

  def about

  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
