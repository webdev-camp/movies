class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification_id)
    @notification = Notification.find(notification_id)
    user_id = @notification.user_id
    ActionCable.server.broadcast "notification_channel_#{user_id}",
                                        notification: html
  end

  def html
    ApplicationController.render(partial: 'notifications/notification',
                                locals: {notification: @notification})
  end
end
