class IndexController < ActionController::Base
  def index
    @gossip = Gossip.all
  end
end