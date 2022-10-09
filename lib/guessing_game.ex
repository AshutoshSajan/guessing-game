defmodule GuessingGame do
  @moduledoc """
  Documentation for `GuessingGame`.
  A simple guessing game
  """

  @doc """
  this is recursive function and you will get max_try try to guess the number
  """
  def start(life \\ 0) do
    input = IO.gets("Guess the magic number: ")

    guess =
      case Integer.parse(input) do
        {num, _} -> num
        _ -> "invalid input"
      end

    num = Enum.random(1..100)
    max_try = 5

    IO.inspect(life, label: "try")

    cond do
      guess === num ->
        IO.puts("Yep correct")

      guess != num and life < max_try ->
        start(life + 1)

      life < max_try ->
        IO.puts("Wrong answer")
        start(life + 1)

      true ->
        IO.puts("No tries left")
    end
  end
end

GuessingGame.start()
