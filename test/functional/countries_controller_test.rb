require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  setup do
    @country = countries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country" do
    assert_difference('Country.count') do
	post :create, :country => { :language => 'english', :name => 'England'}
    end

    assert_redirected_to country_path(assigns(:country))
  end

  test "should show country" do
    get :show, id: @country
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @country
    assert_response :success
  end

  test "should update country" do
    put :update, id: @country, country: { language: @country.language, name: @country.name }
    assert_redirected_to country_path(assigns(:country))
  end

  test "should destroy country" do
    assert_difference('Country.count', -1) do
      delete :destroy, id: @country
    end

    assert_redirected_to countries_path
  end

  test "should unpublish country" do
    get :unpublish, id: @country
    assert_equal 'Country was successfully updated.', flash[:notice]
  end;

  test "should remove country" do
    get :remove, id: @country
    assert_equal 'Country was successfully updated.', flash[:notice]
  end;
end
