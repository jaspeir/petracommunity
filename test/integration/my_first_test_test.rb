require "#{File.dirname(__FILE__)}/../test_helper"

class MyFirstTestTest < ActionController::IntegrationTest
  # fixtures :your, :models
  
  def setup
#    @controller = 
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
  
  def test_another_truth
    get "/"
    assert_response :success
    assert_template "greeting"
  end
end
