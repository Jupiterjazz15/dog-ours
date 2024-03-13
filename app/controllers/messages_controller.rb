class MessagesController < ApplicationController

  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.walk = @booking.walk
    @message.user = current_user
    @walk = @booking.walk
    if @message.save
      WalkChannel.broadcast_to(
        @walk,
        message: render_to_string(partial: "messages", locals: { message: @message }),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "walks/show", status: :unprocessable_entity
    end

    def destroy
      @message = Message.find(params[:id])
      @message.destroy
      redirect_to booking_path(@message.booking)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
