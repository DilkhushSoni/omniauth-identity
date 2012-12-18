class FacebookRealtimeUpdatesController < ApplicationController
  
  def verify
    challenge = Koala::Facebook::RealtimeUpdates.meet_challenge(params, "123456")
    respond_to do |format|
      format.text do
        render text: challenge
      end
    end
  end
 
  def update
    # TODO: Handle an incoming POST from Facebook
    head :ok
  end
 
  def subscribe
    updates = Koala::Facebook::RealtimeUpdates.new(:app_id => "279160408873939", :secret => "b6dbfd033dd34420013683fac14a9de9")
    updates.subscribe("user", "feed, friends, likes", "https://lit-harbor-2589.herokuapp.com/callback", "123456")
    head :ok
  end
  
end
