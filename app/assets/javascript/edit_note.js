$(document).ready(function () {

  $('.note-edit-button').on('click', function(event) {
    event.preventDefault();

    debugger
    var link = $(this)
    var note_id = link.data('note-id')
    $(`.edit-note-${note_id}`).toggle()
    $(`.show-note-${note_id}`).toggle()

   })

  // handle courier save

  $('.note-save-button').on('click', function(event) {
    event.preventDefault();

    debugger
    var link = $(this)
    var note_id = link.data('note-id')
    // var product_id = link.data('product-id')
    var product_slug = link.data('product-slug')

    var new_note = $('#edit-note-' + note_id).val()
    var url = Spree.url('/admin/products/' + product_slug + '/notes/' + note_id + '.json')

    $.ajax({
      type: 'PUT',
      url: url,
      data: {
        note: {
          note: new_note
        },
        token: Spree.api_key
      },
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
    }).done(function () {
      window.location.reload()
    }).fail(function (msg) {
      alert(msg.responseJSON.message || msg.responseJSON.exception)
    })
    
   })

   $('.note-cancel-button').on('click', function(event) {
    event.preventDefault();

    var link = $(this)
    var note_id = link.data('note-id')
    $(`.edit-note-${note_id}`).toggle()
    $(`.show-note-${note_id}`).toggle()
   })
})


