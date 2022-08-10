# frozen_string_literal: false

require 'yaml'

module Command
  class SaveCommand
    attr_reader :obj
    attr_accessor :yml_file

    def initialize(obj, yml_file)
      @obj = obj
      @yml_file = yml_file
    end

    def execute
      File.write(@yml_file, @obj.to_yaml)
    end
  end
end
