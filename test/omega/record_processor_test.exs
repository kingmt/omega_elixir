
defmodule Omega.RecordProcessorTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "$12.34 to pennies" do
    record = %{"price" => "$12.34"}
    assert Omega.RecordProcessor.price_in_pennies(record) == 1234
  end

  test "$12.342 to pennies" do
    record = %{"price" => "$12.34"}
    assert Omega.RecordProcessor.price_in_pennies(record) == 1234
  end

  test "creating a new product" do
    record = %{ "id": 123456,
                "name": "Nice Chair",
                "price": "$30.25",
                "category": "home-furnishings",
                "discontinued": false
              }
    Omega.RecordProcessor.create_new_product record
    product = Omega.Product
              |> Omega.Repo.get_by( external_product_id: "123456")
    assert product != nil
    assert product.name == "Nice Chair"
    assert product.price == 3025
  end
end
