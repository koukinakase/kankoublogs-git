class PrefecturesController < ApplicationController
  def index
  end

  def show
    @prefecture=Prefecture.find(params[:id])
    @blogs = @prefecture.blogs.order(id: :desc)
  end
end
