#alert 'foo'
#source = new EventSource('/panoramas/instantiate_stitch')
#source.addEventListener 'stitch_event', (e) ->
#  alert e.data

#  message = $.parseJSON(e.data).message
#  $('#chat').append($('<li>').text("#{message.name}: #{message.content}"))

document.addEventListener 'turbolinks:load', ->
  $ ->
    $('.grid-production').hide()

    imagesPreview = (input, placeToInsertImagePreview) ->
      if input.files
        $(placeToInsertImagePreview).empty()
        $(placeToInsertImagePreview).sortable("destroy")
        filesAmount = input.files.length
        i = 0
        while i < filesAmount
          reader = new FileReader

          reader.imageIndex = i
          reader.fileName = input.files[i].name
          reader.onload = (event) ->
            $($.parseHTML("<div id='" + event.target.fileName + "'>")).css("background-image", "url(" + event.target.result + ")").appendTo placeToInsertImagePreview
            return

          reader.readAsDataURL input.files[i]
          i++
        $(placeToInsertImagePreview).sortable()
      return

    clickTargetOnEnter = (e, target) ->
      if e.keyCode == 13
        $(target).click()
      return

    bindSetOrder = ->
      $('.set-order').on 'click', ->
        newImageOrder = '['
        $.each $('#target div'), (index, imageDiv) ->
          newImageOrder += '"' + $(imageDiv).attr('id') + '",'
          return
        newImageOrder = newImageOrder.slice(0, -1) + ']'
        $('#panorama_image_order').val(newImageOrder)
        $('.panorama-form').submit()
        return
      return

    $('.photo-input').on 'change', ->
      imagesPreview this, '#target'
      bindSetOrder()
      return

    $('.set-grid-size').on 'click', ->
      $('.grid-sizing').hide()
      widthCount = $('.grid-width').val()
      widthPercent = (100 / widthCount) - 1
      $('#target div').css('width', widthPercent + '%')

      sortMe = (a, b) ->
        $(a).attr('class') > $(b).attr('class')

      elem = $('#target').find('div').sort(sortMe)
      $('#target').append elem

      $('.grid-production').show()
      return

    $('.grid-width').keypress (e) ->
      clickTargetOnEnter(e, '.set-grid-size')
      return

    if $('#source-images').length > 0
      width = $('#source-images').attr('class')
      widthPercent = 100 / width - 1
      $('#source-images div').css 'width', widthPercent + '%'

  return