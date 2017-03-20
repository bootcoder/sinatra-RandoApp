$(document).ready(function() {
  usersShowClickListener()
});

var usersShowClickListener = function () {
  $('.user-show-index-link').on('click', function (e){

    e.preventDefault()

    var userEvent = $(this)
    var userUrl = $(this).attr('href')

    if(userEvent.parent().find('ul').length == 1){
      userEvent.parent().find('ul').toggle()
    }else{


      var request = $.ajax({
        url: userUrl,
        type: 'GET'
      })

      request.done(function(response){
        userEvent.after(response)

      })

      request.fail(function(response){
        console.log(response)
        console.log('You fucked up or something professional....')
      })
    }
  })
}
