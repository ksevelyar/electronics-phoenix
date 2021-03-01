defmodule ElectronicsShop.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :address, :string
    field :email, :string
    field :first_name, :string
    field :is_active, :boolean, default: false
    field :is_admin, :boolean, default: false
    field :last_name, :string
    field :password_hash, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :first_name, :last_name, :address, :is_active, :is_admin, :password_hash, :phone])
    |> validate_required([:email, :first_name, :last_name, :address, :is_active, :is_admin, :password_hash, :phone])
    |> unique_constraint(:email)
    |> unique_constraint(:phone)
  end
end
