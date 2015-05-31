$(document).ready ->
  $('.bxslider').bxSlider(mode: 'fade', infiniteLoop: true, speed: 500)

$(document).ready ->
  $('.follower-search').select2(placeholder: "Select a follower").on "change", (e) ->
    screenName = $('.follower-search').select2('val')
    return if not screenName
  
    request = $.ajax({
      url: "/users/tweets/",
      data: { screen_name: screenName },
      type: 'GET',
    })
  
