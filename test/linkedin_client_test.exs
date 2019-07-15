defmodule LinkedinClientTest do
  use ExUnit.Case
  doctest LinkedinClient

  test "greets the world" do
    assert LinkedinClient.hello() == :world
  end
end
