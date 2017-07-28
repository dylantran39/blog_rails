class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :views_share
  def views_share
    @search = Post.search params[:q]
    @posts = @search.result.page(params[:page]).per Settings.posts.items_per_page
    @categories = Category.all
  end
end
