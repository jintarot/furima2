class CardsController < ApplicationController
  def index
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end

  def new; end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.create(
      description: 'test',
      card: params[:token]
    )
    card = Card.new(customer_token: customer.id, card_token: params[:token], user_id: current_user.id)
    if card.save
      redirect_to root_path
    else
      render :new
    end
  end
end
