require File.dirname(__FILE__) + '/../spec_helper'
describe SwfUpload do
  describe :responds_to_swf_upload do
    it "should get added to a class that includes SwfUpload" do
      test_controller = TestController.new
      TestController.send(:include, SwfUpload)
      test_controller.class.should respond_to(:responds_to_swf_upload)
    end

    it "should be available in ApplicationController" do
      ApplicationController.should respond_to(:responds_to_swf_upload)
    end

    it "should set the mime type based off the file extension if it is 'application/octet-stream'" do
      pending
    end
  end
end
