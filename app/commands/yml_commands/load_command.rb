# frozen_string_literal: true

require 'yaml'
require 'codebreaker'
require_relative '../../rating/table'

module Command
  class LoadCommand
    attr_accessor :yml_file

    def initialize(yml_file)
      @yml_file = yml_file
    end

    def execute
      YAML.load_file(@yml_file,
                     permitted_classes: [Table, Symbol],
                     aliases: true)
    end
  end
end
