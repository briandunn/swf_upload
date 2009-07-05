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

    describe :guess_mime_type do
      before do
        self.class.send(:include, SwfUpload )
      end

      it "should add guess_mime_type as a before_filter" do
        self.class.should_receive(:before_filter).with(:guess_mime_type, {})
        self.class.responds_to_swf_upload
      end

      it "should set the mime type based off the file extension if it is 'application/octet-stream'" do
        upload = stub('uploaded file')
        upload.stub!( :content_type => 'application/octet-stream', :original_filename => 'ruby.jpg' )
        self.stub!(:params => {'Filedata' => upload }) 
        upload.should_receive(:content_type=).with do |type|
          type.to_s.should match(/image/)
        end
        self.class.stub(:before_filter)
        self.class.responds_to_swf_upload
        self.send(:guess_mime_type)
      end
    end
  end
end
