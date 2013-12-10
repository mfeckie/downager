require 'zip'

module Downager
  class Archiver
    attr_reader :namespace, :input_file_array, :switcher

    def initialize(namespace: nil, input_file_array: nil, switcher: nil)
      @namespace = namespace
      @input_file_array = input_file_array
      @switcher = switcher
    end



  end
end