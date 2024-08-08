defmodule RockeliveryWeb.UserJSONTest do
  use RockeliveryWeb.ConnCase, async: true

  alias Rockelivery.Users.User
  alias RockeliveryWeb.UserJSON

  import Rockelivery.Factory

  describe "create/1" do
    test "returns user data" do
      user = build(:user)

      response = UserJSON.create(%{user: user})

      expected_response = %{
        message: "User created successfully",
        user: %User{
          id: "678ab91a-778e-4798-a81f-2e6ee6f4869e",
          address: "Rua dos Bobos, 0",
          age: 18,
          cep: "00000000",
          cpf: "00000000000",
          email: "fulano@mail.com",
          password: "123456",
          password_hash: nil,
          name: "Fulano",
          inserted_at: nil,
          updated_at: nil
        }
      }

      assert response == expected_response
    end
  end

  describe "show/1" do
    test "returns user data" do
      user = build(:user)

      response = UserJSON.show(%{user: user})

      expected_response = %{
        user: %User{
          id: "678ab91a-778e-4798-a81f-2e6ee6f4869e",
          address: "Rua dos Bobos, 0",
          age: 18,
          cep: "00000000",
          cpf: "00000000000",
          email: "fulano@mail.com",
          password: "123456",
          password_hash: nil,
          name: "Fulano",
          inserted_at: nil,
          updated_at: nil
        }
      }

      assert response == expected_response
    end
  end
end
