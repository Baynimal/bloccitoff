class ItemsController < ApplicationController
  def create
    @user = User.find(params[:id] || current_user.id)
    @item = @user.items.build(item_params)

    if @item.save
      flash[:notice] = "Item was added to the list."
    else
      flash[:alert] = "Item was not added, try again."
    end
    redirect_to @user
  end

  def destroy
    @item = current_user.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item has been deleted."
    else
      flash[:alert] = "Item was not deleted, try again, "
    end
    respond_to do |format|
      format.html {redirect_to [current_user, @item]}
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
