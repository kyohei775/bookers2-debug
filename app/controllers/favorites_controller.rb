class FavoritesController < ApplicationController
  
  def create
  	@book = Book.find(params[:book_id])
  	@favorite = @book.favorites.new(book_id: @book.id, user_id: current_user.id)
  	@favorite.save
  	 redirect_back(fallback_location: root_path)
  end

  def destroy
  	@book = Book.find(params[:book_id])
    @favorite = @book.favorites.find_by(book_id: @book.id, user_id: current_user.id)
    @favorite.destroy
     redirect_back(fallback_location: root_path)
  end

  private
    def favorite_params
      params.require(:favorite).permit(:book_id, :user_id)
    end
  
  
  
end
