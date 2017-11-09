App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    console.log("connected")
    # Called when the subscription is ready for use on the server
    $('.notification-card a').click ->
      notification_id = this.dataset['notification']
      console.log notification_id
      $('#notification_' + notification_id).fadeOut()
      App.notification.read(notification_id)

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)

    # Called when there's incoming data on the websocket for this channel
    $('.notifications').prepend(data['notification'])

  read:(id) ->
    @perform 'read', id:id
