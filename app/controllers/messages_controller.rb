class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @booking = Booking.find(params[:booking_id])
    @message.walk = @booking.walk
    @message.user = current_user
    @walk = @message.walk
    if @message.save
      WalkChannel.broadcast_to(
        @walk,
        render_to_string(partial: "messages", locals: { message: @message })
      )
      head :ok
    else
      render "walks/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
