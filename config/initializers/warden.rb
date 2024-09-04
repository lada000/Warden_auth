Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = ->(env) { SessionsController.action(:new).call(env) }
end
