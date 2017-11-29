class ItemController < ApplicationController
  
  before_filter :must_be_admin, only: [:edit, :new, :create]
  
  def all
  @item= Item.all.order(created_at: :desc)
  end
  
  def show
    @item = Item.find(params[:item_id])
  end
  
  def brand
  end

  def fashion
    @item = Item.where("category": "fashion")
  end

  def cosmetic
    @item = Item.where("category": "cosmetic")
  end

  def shoes
    @item = Item.where("category": "shoes")
  end

  def ect
    @item = Item.where("category": "ect")
  end
  
  def new
    @item= Item.new
  end
  
  def edit
    # authorize_action_for @item
  end
  
  def destory
    # authorize_action_for @item
  end
  
  def create
    @item= Item.new
    @item.name= params[:name]
    @item.price= params[:price]
    @item.brand= params[:brand]
    @item.category= params[:category]
    @item.dueDate= params[:duedate]
    @item.url= params[:url]
    @item.content= params[:content]
    @item.image= params[:image]
    @item.save
    # authorize_action_for @item
    redirect_to '/item/all'
    
  end
  
  def must_be_admin
    unless current_user && current_user.roles.last.name == 'admin'
      redirect_to root_path, notice: "Some message"
    end
  end
end