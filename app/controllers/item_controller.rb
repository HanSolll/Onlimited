class ItemController < ApplicationController
  def all
  @items= Item.all.order(created_at: :desc)
  end
  
  def show
  end
  
  def brand
  end

  def fashion
  end

  def cosmetic
  end

  def shoes
  end

  def ect
  end
  
  def new
    @item= Item.new
  end
  
  def edit
    authorize_action_for @item
  end
  
  def destory
    authorize_action_for @item
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
    
    redirect_to '/item/all'
 
  end
  
  def hashtags
    tag =Tag.find_by(name: params[:name])
    @items= tag.items
  end
  
  def search
    
    @items = Item.search(params[:search])
    
  end
end
