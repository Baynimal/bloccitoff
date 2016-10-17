class ItemsController < ApplicationController
  def create
    @user = User.find(params[:id] || current_user.id)
    @item = @user.items.build(item_params)

    if @item.save
      # flash good
    else
      #flash bad
    end

    redirect_to @user
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end
end
