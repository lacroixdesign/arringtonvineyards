class PagesController < ApplicationController
  def index
    @alt_footer = true
    @images = ["bg1.jpg", "bg4.jpg", "bg2.jpg", "bg3.jpg"]
    @images.map! {|img| view_context.image_path(img) }
    @gallery = [
      {images: @images},
      {images: @images.reverse}
    ]
    # @images = @images * 3
  end
end
