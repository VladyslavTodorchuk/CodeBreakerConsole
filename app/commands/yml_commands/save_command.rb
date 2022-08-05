# frozen_string_literal: false

require 'yaml'

module Command
  class SaveCommand
    attr_reader :obj

    def initialize(obj)
      @obj = obj
    end

    def execute
      File.write('./storage/data.yml', @obj.to_yaml)
    end
  end
end
