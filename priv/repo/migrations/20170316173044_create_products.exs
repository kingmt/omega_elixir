defmodule Omega.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :external_product_id, :string # Omega's id
      add :price, :integer # in pennies
      add :product_name, :string # Omega's name

      timestamps([type: :utc_datetime, usec: false])
    end
  end
end
