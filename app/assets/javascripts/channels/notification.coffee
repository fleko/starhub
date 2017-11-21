App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (review) ->
        $(review_notification).text("A review has just been created for " + review.product + ", with a rating of " + review.rating)
    # Called when there's incoming data on the websocket for this channel
