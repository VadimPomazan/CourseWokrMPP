class OrderItemsController < InheritedResources::Base

  private

    def order_item_params
      params.require(:order_item).permit(:order_id, :analysis_id)
    end

end
