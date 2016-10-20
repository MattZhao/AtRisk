class MessagesController < ApplicationController
  def show
    render template: "messages/#{params[:page]}"
  end
end