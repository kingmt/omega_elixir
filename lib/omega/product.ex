defmodule Omega.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :external_product_id, :string # Omega's id
    field :price, :integer # in pennies
    field :product_name, :string # Omega's name
    has_many :past_price_records, Omega.PastPriceRecord
    timestamps()
  end

  def changeset(product, params \\ %{}) do
    product
    |> cast(params, [:price, :external_product_id, :product_name])
    |> validate_required([:price, :external_product_id, :product_name])
    |> unique_constraint(:external_product_id)
  end
end
