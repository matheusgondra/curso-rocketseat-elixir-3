defmodule RockeliveryWeb.UserControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(~p"/api", params)
        |> json_response(:created)

      assert %{
               "message" => "User created successfully",
               "user" => %{
                 "address" => "Rua dos Bobos, 0",
                 "age" => 18,
                 "cep" => "00000000",
                 "cpf" => "00000000000",
                 "email" => "fulano@mail.com",
                 "id" => _id,
                 "name" => "Fulano"
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = build(:user_params, %{"email" => nil})

      response =
        conn
        |> post(~p"/api", params)
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"email" => ["can't be blank"]}}

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "678ab91a-778e-4798-a81f-2e6ee6f4869e"
      insert(:user)

      response =
        conn
        |> delete(~p"/api/#{id}")
        |> response(:no_content)

      assert response == ""
    end
  end
end
