require './config/environment'
# require 'rack-flash'

begin
  fi_check_migration
  # use Rack::Flash
  use Rack::MethodOverride

  use GenresController
  use SongsController
  use ArtistsController
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
