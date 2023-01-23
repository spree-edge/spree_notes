$(document).ready(function () {
  // handle note edit click
  $('.note-edit-button').on('click', function(event) {
    event.preventDefault();

    var link = $(this)
    var note_id = link.data('note-id')
    $(`.edit-note-${note_id}`).toggle()
    $(`.show-note-${note_id}`).toggle()
   })

  // handle note save
  $('.note-save-button').on('click', function(event) {
    event.preventDefault();

    var link = $(this)
    var note_id = link.data('note-id')
    var new_note = $('#edit-note-' + note_id).val()
    var url = Spree.url('/admin/notes/' + note_id)

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

  // handle note cancel click
   $('.note-cancel-button').on('click', function(event) {
    event.preventDefault();

    var link = $(this)
    var note_id = link.data('note-id')
    $(`.edit-note-${note_id}`).toggle()
    $(`.show-note-${note_id}`).toggle()
   })
})


