// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// convert this to es6
$(document).on('turbolinks:load', function() {
    var selectizeCalback = null;
    $('.sound-modal').on('hide.bs.modal', function() {
        if (selectizeCalback != null) {
            selectizeCalback();
            selectizeCalback = null;
        }    
    });

    $('#new_sound').on('submit', function(e) {
        e.preventDefault();
        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function(response) {
                selectizeCalback({
                    value: response.id,
                    text: response.name
                });
                $('.sound-modal').modal('toggle');
                $.rails.enableFormElements($('#new_sound'));
            },
            error: function(xhr) {
                // Figure out how to show errors
                errors = $.parseJSON(xhr.responseText).errors
            }
        });
    });
    
    $('.selectize').selectize({
        maxItems: 1,
        maxOptions: 5,
        hideSelected: true,
        closeAfterSelect: true,
        placeholder: 'Add a sound to your board.',
        render: {
            option: function(item, escape) {
                var label = item.description;
                var caption = item.text;
                return '<div class="option">' +
                     (label ? '<span class="label">' + escape(label) + '</span>' : '') +
                    (caption ? '<span class="caption">' + escape(caption) + '</span>' : '') +
                '</div>';
            }
        },
        onType: function(text) {
            if(!text.length) {
                this.clearOptions(); 
                this.close();
            }
        },
        load: function(query, callback) {
            if (!query.length) return callback(); 
            $.ajax({
                url: '/sounds',
                type: 'GET',
                data: { 
                    search_str: query,
                    board_id: location.pathname.replace('/boards/','')
                },
                dataType: 'json',
                error: function() {
                    console.log('Error loading ' + field);
                    callback();
                },
                success: function(res) {
                    callback([res]);
                }
            });
        },
        create: function(input, callback) {
            selectizeCalback = callback;
            $('.sound-modal').modal();
            $('#new_sound').trigger('reset');
            $('#sound_name').val(input);

        }
  })
});