# frozen_string_literal: true

require 'yaml'
require 'codebreaker'
require_relative '../../../app/rating/user'
require_relative '../../../app/rating/table'

module Command
  class LoadCommand
    def execute
      YAML.load_file('./storage/data.yml',
                     permitted_classes: [Symbol, Table, User, CodeBreaker::Game, CodeBreaker::CodeBreakerGame],
                     aliases: true)
    end
  end
end
