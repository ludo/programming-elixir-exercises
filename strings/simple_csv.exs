# Exercise: StringsAndbinaries-7
#
# SimpleCsv.parse("strings/sales.csv")
defmodule SimpleCsv do
  def parse(filename) do
    { _, file } = File.open(filename)
    keys = _parse_line(IO.read(file, :line), &binary_to_atom(&1))
    Enum.map(IO.stream(file, :line), &Enum.zip(keys, _parse_line(&1, fn (value) -> _parse_value(value) end)))
  end

  defp _parse_line(line, mapper) do
    line
    |> String.strip
    |> String.split(",")
    |> Enum.map(&mapper.(&1))
  end

  defp _parse_value(value) do
    cond do
      String.starts_with?(value, ":") -> String.lstrip(value, ?:) |> binary_to_atom
      Regex.run(%r/\d+\.\d+/, value) -> binary_to_float(value)
      Regex.run(%r/\d+/, value) -> binary_to_integer(value)
      true -> value
    end
  end
end

defmodule Taxes do
  def calc_order_totals(orders, tax_rates) do
    lc order inlist orders do
      total_amount = _calc_total(order[:net_amount], tax_rates[order[:ship_to]])
      order ++ [ total_amount: total_amount ]
    end
  end

  defp _calc_total(net_amount, nil), do: net_amount
  defp _calc_total(net_amount, tax_rate), do: net_amount * (1 + tax_rate)

  def run do
    tax_rates = [ NC: 0.075, TX: 0.08 ]
    orders = SimpleCsv.parse("strings/sales.csv")
    IO.inspect Taxes.calc_order_totals(orders, tax_rates)
  end
end
