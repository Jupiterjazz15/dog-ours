class WalkChannel < ApplicationCable::Channel
  def subscribed
    walk = Walk.find(params[:id])
    stream_for walk
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
