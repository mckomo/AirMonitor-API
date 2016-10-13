# frozen_string_literal: true
require 'csv'

SEEDS_DIR = Rails.root.join('db', 'seeds')

def load_seeds(file_name)
  YAML.load_file File.join(SEEDS_DIR, file_name)
end

if User.empty?

  puts 'Seeding the database'.green.on_black

  User.create! load_seeds('users.yml')
  Subject.create!(load_seeds('subjects.yml'))
  Norm.create! load_seeds('norms.yml')
  Station.create! load_seeds('stations.yml')
  Channel.create! load_seeds('channels.yml')

else

  puts 'Database is already seeded'.red.on_black

end
