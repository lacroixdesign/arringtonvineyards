class PagesController < ApplicationController
  def index
    @alt_footer = true
    @images1 = (1..9).map {|n| "http://arrington-vineyards-dev.s3.amazonaws.com/prototype/gallery/bg-#{n}.jpg" }
    @images2 = (10..20).map {|n| "http://arrington-vineyards-dev.s3.amazonaws.com/prototype/gallery/bg-#{n}.jpg" }
    @gallery = [
      {images: @images1},
      {images: @images2}
    ]
  end
end
