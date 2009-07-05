require File.expand_path(File.dirname(__FILE__) + "/../../../../spec/spec_helper")
class TestController < ActionController::Base
  def self.helper(s) s; end
end
