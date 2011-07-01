class ProductsController < ApplicationController
  def index
    @products = nil
    @products = if params[:sort_by] && %w(name price desire created_at).include?(params[:sort_by]) and params[:sort_direction] && %w(DESC ASC).include?(params[:sort_direction])
      Product.order("#{params[:sort_by]} #{params[:sort_direction]}")
    else
      Product.all
    end.paginate :page => params[:page], :per_page => 22
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Wish successfully created"
      redirect_to products_path
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to products_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
  
  def research
    @product = Product.find(params[:id])
  end
end