class IndexController < ActionController::Base
  def first_page
    @gossip = Gossip.all
  end
end