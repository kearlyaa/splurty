class QuotesController < ApplicationController
  
  def index
    @quote = Quote.order("RANDOM()").last
    @year = Time.new.strftime("%Y") 
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid'
    end

    redirect_to root_path
    
  end

  def show
    @quote = Quote.find(params[:id])
  rescue ActiveRecord::RecordNotFound
      flash[:error] = "Quote doesn't exist"
      redirect_to root_path
  end


  def about

  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
