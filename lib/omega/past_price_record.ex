defmodule Omega.PastPriceRecord do
  use Ecto.Schema
  import Ecto.Changeset

  schema "past_price_records" do
    belongs_to :product, Omega.Product # reference to our product record
    field :price, :integer # in pennies
    field :percent_change, :float
    timestamps()
  end

  def changeset(past_price_record, params \\ %{}) do
    past_price_record
    |> cast(params, [:price, :percent_change, :product_id])
    |> validate_required([:price, :percent_change, :product_id])
    |> cast_assoc(:product)
  end
end
