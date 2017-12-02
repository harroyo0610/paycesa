require 'test_helper'

class InventarioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inventario_index_url
    assert_response :success
  end

  test "should get show" do
    get inventario_show_url
    assert_response :success
  end

end
