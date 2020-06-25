$LOAD_PATH.unshift '.'
require 'config/environment'
use Rack::MethodOverride
run ApplicationController

