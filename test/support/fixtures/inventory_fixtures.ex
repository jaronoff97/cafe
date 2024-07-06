defmodule Cafe.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cafe.Inventory` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        count: 42,
        name: "some name",
        price: 42
      })
      |> Cafe.Inventory.create_item()

    item
  end
end
