require 'test_helper'

class ActivityFlowsTest < ActionDispatch::IntegrationTest
  # called before every single test
  setup do
    @activity = activities(:one)
  end
  
  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end
  
  test "ver a primeira pagina" do
    get "/"
    assert_select "h1", "Cronograma de Estudos"
  end
  
  test "criar uma atividade" do
    get "/activities/new"
    assert_response :success
    
    post "/activities", params: { activity: { title: "can create", body: "Atividade Cadastrada."}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
#    assert_select "p", "Name:\n can create"
    assert_select "p", "Teste"
  end
  
  test "teste visualizar atividade" do
    get activity_url(@activity)
    assert_response :success
  end
  
#  Destroy action must be create soon
  test "teste deletar atividade" do
    assert_difference('Activity.count', -1) do
      delete activity_url(@activity)
    end
    
    assert_redirected_to activities_path
  end
  
#  Update action must be create soon
  test "should update activity" do
    
    patch activity_url(@activity), params: { activity: { name: "updated" } }
    assert_redirected_to activity_path(@activity)
    
    @activity.reload
    assert_equal "updated", @activity.name
  end
  
  
end

