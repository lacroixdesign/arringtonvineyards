class PagesController < ApplicationController
  def v2
    render layout: "v2"
  end

  def v3
    render layout: "v3"
  end
end
