defmodule Rockelivery.Users.CreateTest do
  alias Rockelivery.Error
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.Users.Create
  alias Rockelivery.Users.User

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 18, email: "fulano@mail.com"}} = response
    end

    test "when there are invalid params, returns the error" do
      params = build(:user_params, %{"password" => "123", "age" => 15})

      response = Create.call(params)

      expected_response = %{
        password: ["should be at least 6 character(s)"],
        age: ["must be greater than or equal to 18"]
      }

      assert {:error, %Error{result: changeset, status: :bad_request}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
