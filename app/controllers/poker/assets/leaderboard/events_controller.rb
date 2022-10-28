class Poker::Assets::Leaderboard::EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @event_players = @event.players.order(prize_pool: :desc).limit(9)
  end
end
