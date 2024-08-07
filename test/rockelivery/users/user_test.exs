defmodule Rockelivery.Users.UserTest do
  use Rockelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rockelivery.Users.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        address: "Rua dos Bobos, 0",
        age: 18,
        cep: "00000000",
        cpf: "00000000000",
        email: "fulano@mail.com",
        name: "Fulano",
        password: "123456"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Fulano"}, valid?: true} = response
    end

    test "when there are some error, returns a invalid changeset" do
      params = %{
        address: "Rua dos Bobos, 0",
        age: 15,
        cep: "00000000",
        cpf: "00000000000",
        email: "fulano@mail.com",
        name: "Fulano",
        password: "123"
      }

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        address: "Rua dos Bobos, 0",
        age: 18,
        cep: "00000000",
        cpf: "00000000000",
        email: "fulano@mail.com",
        name: "Fulano",
        password: "123456"
      }

      update_params = %{name: "Siclano"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Siclano"}, valid?: true} = response
    end

    test "when there are some error, returns a invalid changeset" do
      params = %{
        address: "Rua dos Bobos, 0",
        age: 18,
        cep: "00000000",
        cpf: "00000000000",
        email: "fulano@mail.com",
        name: "Fulano",
        password: "123456"
      }

      update_params = %{age: 15, cep: "000"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        cep: ["should be 8 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
