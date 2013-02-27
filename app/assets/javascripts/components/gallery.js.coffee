# Gallery data example:
# data = [
#   { "images": ["img1.jpg", "img2.jpg"] },
#   { "images": ["img1.jpg", "img2.jpg"] },
#   { "images": ["img1.jpg", "img2.jpg"] }
# ]



# Spinner Options
spinnerOpts =
  lines:   11 # The number of lines to draw
  length:  4  # The length of each line
  width:   3  # The line thickness
  radius:  7 # The radius of the inner circle
  corners: 1  # Corner roundness (0..1)
  rotate:  0  # The rotation offset
  color:   "#bbb" # #rgb or #rrggbb
  speed:   1  # Rounds per second
  trail:   60 # Afterglow percentage
  shadow:  false # Whether to render a shadow
  hwaccel: false # Whether to use hardware acceleration
  className: 'spinner' # The CSS class to assign to the spinner
  zIndex:  2e9   # The z-index (defaults to 2000000000)
  top:     'auto' # Top position relative to parent in px
  left:    'auto' # Left position relative to parent in px



# Gallery
# 
#   @rows
#   @el
#   @isReady
# 
class Gallery
  constructor: (@el, data) ->
    # Init rows w/ images
    @rows = []
    for row in data
      galleryRow = new GalleryRow(row.images, @)
      @rows.push galleryRow                        

    @resize()
    delayedResize = _.debounce(@resize, 10)
    $(window).resize(delayedResize)
    @spinner = new Spinner(spinnerOpts).spin(@el[0])

  # Check if rows are ready
  updateState: ->
    @isReady = _.every @rows, (row) ->
      row.isReady
    @start() if @isReady

  # Append rows to gallery
  start: ->
    for row in @rows
      @el.append(row.el)
    @spinner.stop()
    @resize()

  # Determine gallery height & set row heights
  resize: =>
    windowHeight  = $(window).height()
    navHeight     = $("#l-nav").height()
    footerHeight  = $("#l-footer").height()
    # Subtract 2 to compensate for top & bottom padding of 1px
    galleryHeight = windowHeight - navHeight - footerHeight - 2
    @el.height(galleryHeight).css("top", navHeight+1)

    if @rows.length > 0
      for row in @rows
        row.resize(galleryHeight / @rows.length)



# Gallery Row
# 
#   @images
#   @el
#   @container
#   @isReady
# 
class GalleryRow
  constructor: (sources, @gallery) ->
    # Elements
    @el = $("<div class='m-gallery-row'><div class='wrap'><table></table></div></div>")
    @container = $("<tr data-gallery-row></tr>")
    @el.hide().find("table").html(@container)

    # Init Images
    @images = []
    for src in sources
      img = new GalleryImage(src, @)
      # @el.append(el)
      @images.push(img)

  # Check if images are ready
  updateState: ->
    @isReady = _.every @images, (img) ->
      img.isReady
    if @isReady
      @start()
      @gallery.updateState()

  # Append images to row
  start: ->
    for img in @images
      @container.append(img.el)
    @el.fadeIn(1500)

  # Resize row & call resize() on images
  resize: (height) ->
    @el.height(height)
    if @images.length > 0
      for img in @images
        img.resize(height)



# Gallery Image
# 
#   @src
#   @el
#   @row
#   @width
#   @height
#   @isReady
#   @isBroken
#   @isLoaded      
# 
class GalleryImage
  constructor: (@src, @row) ->
    @el = $("<td></td>")
    @load()

  # Async image load
  load: ->
    $img = $("<img>")
    loaded = $img.attr("src", @src).imagesLoaded()

    # Result of image load
    loaded.progress (isBroken) =>
      if isBroken
        @el.remove()
        @isBroken = true
      else
        @setRealSize()
        @el.html($img)
        @isLoaded = true

      @isReady = true
      @row.updateState()

  # Set image natural size
  setRealSize: ->
    img = new Image()
    img.src = @src
    @width  = img.width
    @height = img.height

  # Resize image w/ proper ratio
  resize: (rowHeight) ->
    # Subtract 2 to compensate for top & bottom padding of 1px
    newHeight = rowHeight - 2
    ratio = newHeight / @height
    newWidth  = parseInt(@width * ratio)
    @el.find("img").width(newWidth).height(newHeight)



# Page Load
jQuery ->
  $galleryEl = $("[data-gallery]").first()
  data = $galleryEl.data("gallery")
  if $galleryEl.length > 0 and data
    window.gallery = new Gallery($galleryEl, data)
