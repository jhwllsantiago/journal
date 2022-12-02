class PagesController < ApplicationController
  def home
    redirect_to categories_url if current_user
  end

  def about
  end
end
