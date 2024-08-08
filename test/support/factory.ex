defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.Users.User

  def user_params_factory do
    %{
      "address" => "Rua dos Bobos, 0",
      "age" => 18,
      "cep" => "00000000",
      "cpf" => "00000000000",
      "email" => "fulano@mail.com",
      "name" => "Fulano",
      "password" => "123456"
    }
  end

  def user_factory do
    %User{
      id: "678ab91a-778e-4798-a81f-2e6ee6f4869e",
      address: "Rua dos Bobos, 0",
      age: 18,
      cep: "00000000",
      cpf: "00000000000",
      email: "fulano@mail.com",
      name: "Fulano",
      password: "123456"
    }
  end
end
