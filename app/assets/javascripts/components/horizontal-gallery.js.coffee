# Horizontal Gallery
class horizontalGallery
  constructor: (@gallery) ->
    @resize()
    delayedResize = _.debounce(@resize, 10)
    $(window).resize(delayedResize)
  resize: =>
    galleryHeight = @gallery.height()
    @gallery.find("img").each ->
      $img = $(@)
      realHeight = $img.data("height")
      realWidth  = $img.data("width")
      ratio = galleryHeight / realHeight
      newHeight = galleryHeight
      newWidth  = parseInt(realWidth * ratio)
      $img.width(newWidth).height(newHeight)

# Page Load
jQuery ->
  if $(".m-horizontal-gallery").length > 0
    $(".m-horizontal-gallery").each ->
      new horizontalGallery $(@)
