defmodule ElectronicsShop.AuthTest do
  use ElectronicsShop.DataCase

  alias ElectronicsShop.Auth

  describe "users" do
    alias ElectronicsShop.Auth.User

    @valid_attrs %{address: "some address", email: "some email", first_name: "some first_name", is_active: true, is_admin: true, last_name: "some last_name", password_hash: "some password_hash", phone: "some phone"}
    @update_attrs %{address: "some updated address", email: "some updated email", first_name: "some updated first_name", is_active: false, is_admin: false, last_name: "some updated last_name", password_hash: "some updated password_hash", phone: "some updated phone"}
    @invalid_attrs %{address: nil, email: nil, first_name: nil, is_active: nil, is_admin: nil, last_name: nil, password_hash: nil, phone: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Auth.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Auth.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Auth.create_user(@valid_attrs)
      assert user.address == "some address"
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.is_active == true
      assert user.is_admin == true
      assert user.last_name == "some last_name"
      assert user.password_hash == "some password_hash"
      assert user.phone == "some phone"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Auth.update_user(user, @update_attrs)
      assert user.address == "some updated address"
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.is_active == false
      assert user.is_admin == false
      assert user.last_name == "some updated last_name"
      assert user.password_hash == "some updated password_hash"
      assert user.phone == "some updated phone"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_user(user, @invalid_attrs)
      assert user == Auth.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Auth.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Auth.change_user(user)
    end
  end
end
