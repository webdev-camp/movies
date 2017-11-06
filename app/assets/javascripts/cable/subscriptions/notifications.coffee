App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    new Notification data["object"], subject: data["subject"]
