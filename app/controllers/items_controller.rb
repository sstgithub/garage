class ItemsController < ApplicationController
	# GET '/items'
	def index
		@items = Item.all
	end

	# GET '/items/new'
	def new
		@new_item = Item.new
	end


	# POST '/items'
	def create
		@new_item = Item.new(item_params)

		if @new_item.save
			redirect_to items_path #"/items"
		end
	end

	# GET '/items/:id'
	def show
		@item = Item.find(params[:id])
	end

	# GET '/items/:id/edit'
	def edit
		@item = Item.find(params[:id])
	end

	# PATCH/PUT '/items/:id'
	def update
		@item = Item.find(params[:id])
		if @item.update_attributes(item_params)
			redirect_to "/items"
		end
	end

	# DESTROY '/items/:id'
	 def destroy
    @item = Item.find(params[:id])
    @item.delete

    # respond_to do |format|
    #   format.html { redirect_to post_comments_path(@post) }
    #   format.xml  { head :ok }
    # end
  end

	# makes it accessible only to the class
	private

	def item_params
		params.require(:item).permit!
	end
end
