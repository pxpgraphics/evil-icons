$ ->

  icons         = $('.icons .icon')
  buttons       = $('.icons__btn')
  colors        = 'green emerald blue purple red yellow'
  colorsArray   = colors.split(' ')
  colorInterval = 8000
  color         = 1


  # Icons size switch

  buttons.on 'click', ->
    modifier = "icon--#{$(@).data('size')}"

    icons.removeClass('icon--s icon--m icon--l');
    icons.addClass(modifier);

    buttons.removeClass('is-active');
    $(@).addClass('is-active');


  # Color change

  changeColor = ->
    $('body')
      .removeClass(colors)
      .addClass(colorsArray[color])
    color = 0 if ++color == colorsArray.length

  setInterval(changeColor, colorInterval)


  # Retina hairlines support check

  if window.devicePixelRatio && devicePixelRatio >= 2
    testElem = $ "<div>",
      id: 'testElem'
      css: { border: ".5px solid transparent" }

    $('body').append(testElem)
    $("html").addClass("hairlines") if testElem[0].offsetHeight == 1
    testElem.remove('#testElem')

