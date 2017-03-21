defmodule Omega.RecordProcessor do
  require Logger

  def add_records %{"productRecords" => records} do
    # iterate over all the records
    records
    |> Enum.each(&find_product(&1))
  end

  def add_records _ do
  end

  def find_product record do
    Omega.Product
    |> Omega.Repo.get_by( external_product_id: Integer.to_string(record["id"]))
    |> record_product(record)
  end

  def record_product nil, record do
    create_new_product record
  end

  def price_in_pennies record do
    record["price"]
    |> String.trim_leading("$")
    |> String.to_float
    |> Kernel.*(100)
    |> Kernel.trunc
  end

  def create_new_product record do
    if record["discontinued"] == false do
      changeset = %Omega.Product{external_product_id: Integer.to_string(record["id"]),
                                 product_name: record["name"],
                                 price: price_in_pennies(record)}
                  |> Product.changeset()
      case Omega.Repo.insert(changeset) do
        {:ok, product} ->
          Logger.info "There is a new product, record created"
        {:error, changeset} ->
          Logger.error "There is a new product, record creation failed: #{}"
      end
    end
  end

  def record_product product, record do
    check_name(product, record)
  end

  def check_name product, record do
    if record["name"] == product.product_name do
      check_price product, record
    else
      #Logger.error "Record from Omega and our record have a name mismatch. Omega record: #{record.inspect}, our record #{product.inspect}"
    end
  end

  def check_price product, record do
    if price_in_pennies(record) != product.price do
      # create new past_price_record
      # update product
    end
  end
end
