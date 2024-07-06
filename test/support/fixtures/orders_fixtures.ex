defmodule Cafe.OrdersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cafe.Orders` context.
  """
  alias Cafe.InventoryFixtures

  @doc """
  Generate a item.
  """
  def order_fixture(attrs \\ %{}) do
    item1 = InventoryFixtures.item_fixture()
    item2 = InventoryFixtures.item_fixture()

    {:ok, order} =
      attrs
      |> Enum.into(%{
        name: "Test McTesterson",
        status: "pending",
        order_items: [
          %{quantity: 2, item_id: item1.id},
          %{quantity: 1, item_id: item2.id}
        ]
      })
      |> Cafe.Orders.create_order()

    order
  end
end
