defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
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
