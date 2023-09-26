class Admin::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all
  end
end
