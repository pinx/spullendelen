require 'test_helper'

class ThingsControllerTest < ActionController::TestCase
  setup do
    @thing = things(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:things)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thing" do
    assert_difference('Thing.count') do
      post :create, thing: { asset_id: @thing.asset_id, borrow_everyone: @thing.borrow_everyone, borrow_friends: @thing.borrow_friends, borrow_groups: @thing.borrow_groups, category_id: @thing.category_id, creator: @thing.creator, description: @thing.description, name: @thing.name, owner_id: @thing.owner_id, personal_story: @thing.personal_story, price: @thing.price, source: @thing.source, source_id: @thing.source_id, source_url: @thing.source_url }
    end

    assert_redirected_to thing_path(assigns(:thing))
  end

  test "should show thing" do
    get :show, id: @thing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thing
    assert_response :success
  end

  test "should update thing" do
    patch :update, id: @thing, thing: { asset_id: @thing.asset_id, borrow_everyone: @thing.borrow_everyone, borrow_friends: @thing.borrow_friends, borrow_groups: @thing.borrow_groups, category_id: @thing.category_id, creator: @thing.creator, description: @thing.description, name: @thing.name, owner_id: @thing.owner_id, personal_story: @thing.personal_story, price: @thing.price, source: @thing.source, source_id: @thing.source_id, source_url: @thing.source_url }
    assert_redirected_to thing_path(assigns(:thing))
  end

  test "should destroy thing" do
    assert_difference('Thing.count', -1) do
      delete :destroy, id: @thing
    end

    assert_redirected_to things_path
  end
end
