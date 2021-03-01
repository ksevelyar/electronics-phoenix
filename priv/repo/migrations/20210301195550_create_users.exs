defmodule ElectronicsShop.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :address, :text
      add :is_active, :boolean, default: false, null: false
      add :is_admin, :boolean, default: false, null: false
      add :password_hash, :string
      add :phone, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:phone])
  end
end
