class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :set_ransack, only: [:search, :detail_search]
  before_action :login_check, only: [:new, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @parents = Category.where(ancestry: nil)
    @newitems = Item.includes(:item_images).order("created_at DESC").limit(5)
    @branditems = Item.includes(:item_images).where("brand IS NOT NULL").order("brand DESC").limit(5)
    @likes = Like.all
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
      @item.item_images.new
      @item.valid?
      render :new
    end
  end

  def edit
    set_category
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      set_category
      set_item
      flash.now[:alert] = '商品編集に失敗しました'
      render :edit
    end
  end

  def show
    @condition = @item.condition
    @delivery_fee = @item.delivery_fee
    @sending_area = @item.sending_area
    @sending_days = @item.sending_days
    @category = @item.category
    @categories =  @category.items.order("created_at DESC").limit(3)
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
    @item.destroy

    flash[:notice] = '商品を削除しました'
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def detail_search
    # カテゴリーボックスの生成
    if @detail_items.present?
      grandchild = @detail_items[0].category
      child = grandchild.parent

      @category_parent_array = Category.where(ancestry: nil)
      @parent_array = []
      @parent_array << @detail_items[0].category.parent.parent
      @parent_array << @detail_items[0].category.parent.parent.id

      @category_children_array = Category.where(ancestry: child.ancestry)
      @child_array = []
      @child_array << child
      @child_array << child.id

      @category_grandchildren_array = Category.where(ancestry: grandchild.ancestry)
      @grandchild_array = []
      @grandchild_array << grandchild
      @grandchild_array << grandchild.id
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand, :condition_id, :delivery_fee_id, :sending_area_id, :sending_days_id, :price, item_images_attributes: [:image, :_destroy, :id]).merge(saler_id: current_user.id, user_id: current_user.id)
  end

  def search_params
    params.require(:q).permit(:name_cont, :brand_cont, :condition_id_in, :delivery_fee_id_in, :category_id_eq, :price_gteq, :price_lteq)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_ransack
    @q = Item.ransack(params[:q])
    @conditions = Condition.all
    @delivery_fees = DeliveryFee.all
    @detail_items = @q.result(distinct: true)
  end

  def set_category
    grandchild = @item.category
    child = grandchild.parent

    @category_parent_array = Category.where(ancestry: nil)
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

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

  def correct_user
    unless @item.user == current_user
      redirect_to root_path
    end
  end

end
