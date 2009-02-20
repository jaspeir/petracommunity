require File.dirname(__FILE__) + '/../test_helper'
require 'spec_general_controller'

# Re-raise errors caught by the controller.
class SpecGeneralController; def rescue_action(e) raise e end; end

class SpecGeneralControllerTest < Test::Unit::TestCase
  def setup
    @controller = SpecGeneralController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
