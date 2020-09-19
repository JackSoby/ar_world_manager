defmodule ArWorldManagerWeb.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :ar_world_manager,
  module: ArWorldManager.Guardian,
  error_handler: ArWorldManagerWeb.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
