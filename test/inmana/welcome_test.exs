defmodule Inmana.WelcomeTest do
  use ExUnit.Case, async: true
  alias Inmana.Welcomer

  describe "welcome/1" do
    test "When the user is special, return a special message" do
      params = %{"name" => "banana", "age" => "42"}

      result = Welcomer.welcome(params)

      expected_result = {:ok, "You are very special Banana"}

      assert result == expected_result
    end

    test "When the user is not special, return a message" do
      params = %{"name" => "Helder", "age" => "45"}

      result = Welcomer.welcome(params)

      expected_result = {:ok, "Welcome helder"}

      assert result == expected_result
    end

    test "When the user is under age, return a erro" do
      params = %{"name" => "Helder", "age" => "17"}

      result = Welcomer.welcome(params)

      expected_result = {:error, "You shall not pass helder"}

      assert result == expected_result
    end
  end
end
