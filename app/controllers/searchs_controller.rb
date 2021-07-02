class SearchsController < ApplicationController

  def search
    search_area = params[:search_area]
    search_method = params[:search_method]
    if search_area == "users"
      if search_method == "all" then
        @users = User.where('name = ?', "#{params[:keyword]}")
      elsif search_method == "parts" then
        @users = User.where('name like ?', "%#{params[:keyword]}%")
      elsif search_method == "previous_parts" then
        @users = User.where('name like ?', "#{params[:keyword]}%")
      else
        @users = User.where('name like ?', "%#{params[:keyword]}")
      end
    else
      if search_method == "all" then
        @books = Book.where('name = ?', "#{params[:keyword]}")
      elsif search_method == "parts" then
        @books = Book.where('name like ?', "%#{params[:keyword]}%")
      elsif search_method == "previous_parts" then
        @books = Book.where('name like ?', "#{params[:keyword]}%")
      else
        @books = Book.where('name like ?', "%#{params[:keyword]}")
      end
      render "search"
    end
  end
end
