require 'test_helper'

class CotizacionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cotizacion_new_url
    assert_response :success
  end

end
