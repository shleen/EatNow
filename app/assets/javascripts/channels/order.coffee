jQuery(document).on 'turbolinks:load', ->
  $notify = $('#notifyOrderReady')
  alert 'yee'
  
  App.order = App.cable.subscriptions.create "OrderChannel",
  received: (data) ->
    $notify.modal
    console.log data.order.id
