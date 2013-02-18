jQuery ->
  if $("#slides").length
    slides = $("#slides").data("slides")

    spinnerOpts =
      lines:   13 # The number of lines to draw
      length:  7  # The length of each line
      width:   4  # The line thickness
      radius:  10 # The radius of the inner circle
      corners: 1  # Corner roundness (0..1)
      rotate:  0  # The rotation offset
      color:   "#aa9962" # #rgb or #rrggbb
      speed:   1  # Rounds per second
      trail:   60 # Afterglow percentage
      shadow:  false # Whether to render a shadow
      hwaccel: false # Whether to use hardware acceleration
      className: 'spinner' # The CSS class to assign to the spinner
      zIndex:  2e9   # The z-index (defaults to 2000000000)
      top:     'auto' # Top position relative to parent in px
      left:    'auto' # Left position relative to parent in px

    target = document.getElementById("slides")
    spinner = new Spinner(spinnerOpts).spin(target)

    $.supersized
      slides: slides
      slide_interval: 5000
      start_slide: 1
      slideshow: true
      transition: "fade"
      transition_speed: 1000
      autoplay: true