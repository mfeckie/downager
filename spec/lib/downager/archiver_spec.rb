require 'spec_helper'
require 'downager/archiver'

output_file_name = Dir.pwd + '/spec/sample_output_files/zipped_directory.zip'
input_path = Dir.pwd + '/spec/sample_files/'
files_for_test = [["1.1.1", "sample_1.txt", input_path + "1.1.1/sample_1.txt"],
                  ["1.1.1", "sample_2.txt", input_path + "1.1.1/sample_2.txt"],
                  ["1.1.2", "sample_10.txt", input_path + "1.1.2/sample_10.txt"],
                  ["1.1.2", "sample_11.txt", input_path + "1.1.2/sample_11.txt"]]

files_with_gaps = [["1.1.1", "sample_1.txt", input_path + "1.1.1/sample_1.txt"],
                   ["1.1.2", "sample_11.txt", input_path + "1.1.2/sample_11.txt"], [], []]


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
      Dir.glob(Dir.pwd + '/spec/sample_output_files/test/*.zip').each {|f| File.delete(f)}
    end

    it "can process the input file array" do
      arch = archiver
      arch.create_zip
      output_file_list = Dir.entries(Dir.pwd + '/spec/sample_output_files/test').to_s
      expect(output_file_list.include?('test')).to eq(true)
    end

    it "Deals with blank array entries gracefully" do
      arch = archiver
      archiver.input_file_array = files_with_gaps
      arch.create_zip
      output_file_list = Dir.entries(Dir.pwd + '/spec/sample_output_files/test').to_s
      expect(output_file_list.include?('test')).to eq(true)
    end

  end

end