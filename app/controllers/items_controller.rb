class ItemsController < ApplicationController
  
  layout 'items_layout'
  before_action :sign_in_check
  
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index    
    
    if params[:search] && current_user.admin?
      @items = Item.all.search(params[:search]).order('name DESC')
    elsif params[:tag] && current_user.admin?
      @items = Item.all.tagged_with(params[:tag])
    elsif params[:search]
      @items = current_user.items.search(params[:search]).order('name DESC')
    elsif params[:tag]
      @items = current_user.items.tagged_with(params[:tag])
    elsif
      @items = current_user.items
      @reminder_items = Item.where("user_id = ? AND alarm = ? ", current_user.id, true)
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
  
  def search
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :user_id, :set_time, :alarm, :tag_list, :search)
    end
end
