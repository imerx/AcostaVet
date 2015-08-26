class CartController < ApplicationController

  before_filter :current_user
  before_filter :find_cart
  

  def add
    @cart.save if @cart.new_record?
    session[:cart_id] = @cart.id
    product = Product.find(params[:id])
    LineItem.create! :order => @cart, :product => product, :price => product.price
    @cart.recalculate_price!
    flash[:notice] = "producto Agregado al carrito!"
    redirect_to '/cart'
  end

  def remove
    item = @cart.line_items.find(params[:id])
    item.destroy
    @cart.recalculate_price!
    flash[:notice] = "Producto borrado del carrito"
    redirect_to '/cart'
  end

  def checkout
    @cart.checkout!
    session.delete(:cart_id)
    flash[:notice] = "la venta se ha registrado exitosamente"
    redirect_to "/admin"
  end

  protected

  def find_cart
    @cart = session[:cart_id] ? Order.find(session[:cart_id]) : current_user.orders.build
  end

end
