#alert 'foo'
#source = new EventSource('/panoramas/instantiate_stitch')
#source.addEventListener 'stitch_event', (e) ->
#  alert e.data

#  message = $.parseJSON(e.data).message
#  $('#chat').append($('<li>').text("#{message.name}: #{message.content}"))