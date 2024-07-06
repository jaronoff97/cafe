defmodule Cafe.InventoryTest do
  use Cafe.DataCase

  alias Cafe.Inventory

  describe "items" do
    alias Cafe.Inventory.Item

    import Cafe.InventoryFixtures

    @invalid_attrs %{count: nil, name: nil, price: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Inventory.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Inventory.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{count: 4, name: "some name", price: 4.50}

      assert {:ok, %Item{} = item} = Inventory.create_item(valid_attrs)
      assert item.count == 4
      assert item.name == "some name"
      assert item.price == Decimal.new("4.5")
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{count: 43, name: "some updated name", price: 43}

      assert {:ok, %Item{} = item} = Inventory.update_item(item, update_attrs)
      assert item.count == 43
      assert item.name == "some updated name"
      assert item.price == Decimal.new("43")
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_item(item, @invalid_attrs)
      assert item == Inventory.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Inventory.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Inventory.change_item(item)
    end
  end
end
