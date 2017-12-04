require 'test_helper'

class CientesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cientes_index_url
    assert_response :success
  end

  test "should get create" do
    get cientes_create_url
    assert_response :success
  end

end
