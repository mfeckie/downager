require 'spec_helper'
require 'downager/archiver'

output_file_name = Dir.pwd + '/spec/sample_output_files/zipped_directory.zip'
input_path = Dir.pwd + '/spec/sample_files/'
files_for_test = [%w(1.1.1 /Users/martinfeckie/rmp/downager/spec/sample_files/1.1.1/sample_1.txt sample_1.txt),
                  %w(1.1.1 /Users/martinfeckie/rmp/downager/spec/sample_files/1.1.1/sample_2.txt sample_2.txt),
                  %w(1.1.2 /Users/martinfeckie/rmp/downager/spec/sample_files/1.1.2/sample_10.txt sample_10.txt),
                  %w(1.1.2 /Users/martinfeckie/rmp/downager/spec/sample_files/1.1.2/sample_11.txt sample_11.txt)]


module Apartment
  class Database
  end
end

class Rails
  def self.root
    Dir.pwd + '/spec'
  end
end

describe Archiver do
  before :each do
    allow(Apartment::Database).to receive(:switch).and_return(true)
  end

  describe "instance methods" do
    let(:archiver) { Archiver.new(namespace: 'test', input_file_array: files_for_test, switcher: Apartment::Database, root_path: Rails.root + '/sample_output_files') }
    after :each do
      if File.exists?(Dir.pwd + '/spec/sample_output_files/test/zipped_file.zip')
        File.delete(Dir.pwd + '/spec/sample_output_files/test/zipped_file.zip')
        Dir.delete(Dir.pwd + '/spec/sample_output_files/test')
      end
    end

    it "can process the input file array" do
      arch = archiver
      arch.create_zip
      output_file_list = Dir.entries(Dir.pwd + '/spec/sample_output_files/test')
      expect(output_file_list.include?('zipped_file.zip')).to eq(true)

    end


  end

end