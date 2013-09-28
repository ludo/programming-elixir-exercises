defmodule MyString do
  # Exercise: StringsAndBinaries-5
  #
  # MyString.center(["cat", "zebra", "elephant"])
  #   cat
  #  zebra
  # elephant
  def center(words) do
    column_width = Enum.max_by(words, &(String.length(&1))) |> String.length
    print Enum.map(words, &(center_word &1, column_width))
  end

  def center_word(word, column_width) do
    length = String.length word
    String.rjust word, round((column_width - length) / 2 + length)
  end

  def print(words) do
    Enum.each words, &(IO.puts &1)
  end

  # Exercise: StringsAndBinaries-6
  #
  # MyString.capitalize_sentences("oh. a DOG. woof.")
  # "Oh. A dog. Woof."
  def capitalize_sentences(text) do
    text
    |> String.split(". ")
    |> Enum.map(&(String.capitalize(&1)))
    |> Enum.join(". ")
  end
end
