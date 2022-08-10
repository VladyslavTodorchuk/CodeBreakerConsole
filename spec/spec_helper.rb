# frozen_string_literal: true

require_relative '../app/rating/table'
require_relative '../app/rating/user'
require_relative '../app/commands/executor'
require_relative '../app/commands/game_commands/stars_command'
require_relative '../app/commands/game_commands/start_command'
require_relative '../app/commands/game_commands/rules_command'
require_relative '../app/commands/yml_commands/load_command'
require_relative '../app/commands/yml_commands/save_command'

require 'simplecov'

SimpleCov.start
