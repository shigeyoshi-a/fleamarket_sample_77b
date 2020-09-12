class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC").limit(5)
    @parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      @category_parent_array = ["---"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    grandchild = @item.category
    child = grandchild.parent
    @parent_array = []
    @parent_array << @item.category.parent.parent.name
    @parent_array << @item.category.parent.parent.id

    @category_children_array = Category.where(ancestry: child.ancestry)
    @child_array = []
    @child_array << child.name
    @child_array << child.id

    @category_grandchildren_array = Category.where(ancestry: grandchild.ancestry)
    @grandchild_array = []
    @grandchild_array << child.name
    @grandchild_array << child.id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand, :condition_id, :delivery_fee_id, :sending_area_id, :sending_days_id, :price, item_images_attributes: [:image, :_destroy, :id]).merge(saler_id: current_user.id, user_id: current_user.id)
  end
end
