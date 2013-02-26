class PagesController < ApplicationController
  def background
    @alt_footer = true
  end

  def horizontal
    @alt_footer = true
    @images = [
      { image: "bg1.jpg", width: 1600, height: 938 },
      { image: "bg4.jpg", width: 800, height: 1172 },
      { image: "bg2.jpg", width: 1600, height: 1067 },
      { image: "bg3.jpg", width: 1600, height: 1067 }
    ]
  end
end
