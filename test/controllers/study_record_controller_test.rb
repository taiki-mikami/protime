require 'test_helper'

class StudyRecordControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get study_record_new_url
    assert_response :success
  end

end
