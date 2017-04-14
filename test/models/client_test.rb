require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "Se puede encontra un cliente por rut" do
    client = Client.from_rut clients(:one).rut

    assert_equal client, (clients :one)
    assert_equal Client.count, 2
  end

  # test "Se crea un cliente nuevo al buscar por rut un cliente inexistente" do
  #   client = Client.from_rut '00000000-0'

  #   original_count = Client.count

  #   assert_equal '00000000-0', client.rut
  #   assert_equal original_count + 1, Client.count
  # end
end
