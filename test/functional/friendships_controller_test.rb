require File.dirname(__FILE__) + '/../test_helper'
require 'friendships_controller'

# Re-raise errors caught by the controller.
class FriendshipsController; def rescue_action(e) raise e end; end

class FriendshipsControllerTest < Test::Unit::TestCase
  def setup
    @controller = FriendshipsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
