class PrintingController < ApplicationController
  def printSelected
    @mer = Mer.find(params[:id])
  end
  
  
  def printAll
    @mers = Mer.all
  end
  
  def addCollection
    @collection = Mer.find(params[:id])
  end
  
  def printCollection
    @mer = Mer.find(2)
  end
  
end