class PrintingController < ApplicationController
  def printSelected
    @mer = Mer.find(params[:id])
  end
  
  
  def printAll
    @mers = Mer.all
  end
end
