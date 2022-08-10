# frozen_string_literal: true

require 'yaml'
require 'codebreaker'
require_relative '../../rating/user'
require_relative '../../rating/table'

module Command
  class LoadCommand
    attr_accessor :yml_file

    def initialize
      @yml_file = './storage/data.yml'
    end

    def execute
      YAML.load_file(@yml_file,
                     permitted_classes: [Symbol, User],
                     aliases: true)
    end
  end
end
