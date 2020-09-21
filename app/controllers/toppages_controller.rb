class ToppagesController < ApplicationController
  def index
    @prefectures=Prefecture.order(id: :asc)
  end
end
