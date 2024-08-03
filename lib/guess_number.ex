defmodule GuessNumber do
  @range 1..100

  def init do
    IO.puts "The game started with a secret number! Try to guess it."
    secret_number = generate_secret_number()
    new_round(secret_number)
  end

  def new_round(secret_number) do
    ask_for_number()
    |> check_guess(secret_number)
    |> handle_result(secret_number)
  end

  def generate_secret_number do
    Enum.random(@range)
  end

  def handle_result({:ok, message}, _) do
    IO.puts message
  end

  def handle_result({:wrong, message}, secret_number) do
    IO.puts message
    new_round(secret_number)
  end

  def check_guess(number, secret_number) do
    cond do
      number == secret_number ->
        {:ok, "You found it. Congrats!"}
      number not in @range ->
        {:wrong, "Invalid number. Choose a number between 0 and 100."}
      number > secret_number ->
        {:wrong, "#{number} is too high."}
      number < secret_number ->
        {:wrong, "#{number} is too low."}
    end
  end

  def ask_for_number() do
    user_prompt = IO.gets "What is your guess? (1-100)? \n"
    parse_number(user_prompt)
  end

  defp parse_number(string) do
    Integer.parse(string)
      |> case do
            {number, _} -> number
          :error ->
            IO.puts "Wrong value. Type only numbers."
            ask_for_number()
      end
  end
end
