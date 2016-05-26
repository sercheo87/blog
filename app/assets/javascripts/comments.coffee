# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:success', 'form#comments-form', (ev, data)->
  console.log data
  $(this).find('textarea').val('')
  $('#comments-box').append("
        <div class='row'>
        <div class='col-sm-1'>
        <div class='thumbnail'>
        <img class='img-responsive user-photo' src='https://ssl.gstatic.com/accounts/ui/avatar_2x.png'>
        </div><!-- /thumbnail -->
        </div><!-- /col-sm-1 -->

        <div class='col-sm-11'>
        <div class='panel panel-default'>
        <div class='panel-heading'>
        <strong>#{data.user.email}</strong> <span class='text-muted'>commented 5 days ago</span>
        </div>
              <div class='panel-body'>
                #{data.body}
              </div><!-- /panel-body -->
            </div><!-- /panel panel-default -->
          </div><!-- /col-sm-5 -->
        </div><!-- /row -->")

$(document).on 'ajax:error', 'form#comments-form', (ev, data)->
  console.error data