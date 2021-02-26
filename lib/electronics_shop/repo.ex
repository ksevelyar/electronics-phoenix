defmodule ElectronicsShop.Repo do
  use Ecto.Repo,
    otp_app: :electronics_shop,
    adapter: Ecto.Adapters.Postgres
end
