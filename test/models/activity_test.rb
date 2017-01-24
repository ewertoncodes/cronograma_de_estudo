require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
  
  test  "teste de cadastro de atividade" do
    activity = Activity.new
    assert_not (activity.name.nil? && activity.save), "uma atividade nÃ£o deve ser salva sem que pelo menos seu nome seja informado"
  end
  
end
