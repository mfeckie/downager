require 'spec_helper'
require 'downager/archive_structure'

describe ArchiveStructure do

  it "creates and ArchiveStructure class" do
    a = ArchiveStructure.new
    a.class.should == ArchiveStructure
  end

end