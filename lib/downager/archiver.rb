require 'zip'

module Downager
  class Archiver
    attr_reader :namespace, :input_file_array, :switcher, :root_path
=begin
     input_file_array is expected in the format ["full file path", "directory file to be stored in", "file_name"]
      For example ["home/somewhere/file_1.txt", "1.1.1", "file_1.txt"]
=end
    def initialize(namespace: nil, input_file_array: nil, switcher: nil, root_path: nil)
      @namespace = namespace
      @input_file_array = input_file_array
      @switcher = switcher
      @root_path = root_path
      @switcher.switch unless @switcher.nil?
    end


    def create_zip
      create_output_directory
      Zip::File.open(root_path + "/#{namespace}" + '/zipped_file.zip', Zip::File::CREATE) do |zipfile|
        input_file_array.each do |file|
          zipfile.add("#{file[0]}/#{file[2]}", file[1])
        end
      end
    end

    private

    def switch_database
      switcher.switch
    end

    def create_output_directory
      Dir.mkdir(root_path + "/#{namespace}") unless Dir.entries(root_path).include?("#{namespace}")
    end

  end
end