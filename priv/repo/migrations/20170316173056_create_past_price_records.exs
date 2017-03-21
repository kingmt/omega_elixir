defmodule Omega.Repo.Migrations.CreatePastPriceRecords do
  use Ecto.Migration

  def change do
    create table(:past_price_records) do
      add :product_id, references(:products) # reference to our product record
      add :price, :integer # in pennies
      add :percent_change, :float

      timestamps()
    end
  end
end
