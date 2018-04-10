class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "The ticker symbol does not exist" unless @stock
    end

    respond_to do |format|
      format.js {render partial: 'stocks/result'}
    end
  end

end
