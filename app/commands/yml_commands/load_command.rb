# frozen_string_literal: true

require 'yaml'

module Command
  class LoadCommand
    def execute
      YAML.load_file('./storage/data.yml', permitted_classes: [Rating], aliases: true)
    end
  end
end
