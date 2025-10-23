## Suma de los elementos diagonal principal
defmodule Concurrencia do
  def main do
    matrix = [[1, 3, 4], [2, 1, 4], [2, 2, 1]]

    t1 = Task.async(fn -> sumar_diagonal(matrix) end)
    t2 = Task.async(fn -> promedio(matrix) end)

    [a, b] = Task.await_many([t1, t2])

    c =
      (a * b)
      |> IO.puts()
  end

  def sumar_diagonal(matrix), do: sumar_diagonal(matrix, 0, 0, 0)

  def sumar_diagonal(matrix, i, _, acc) when length(matrix) == i, do: acc

  def sumar_diagonal(matrix, i, j, acc) do
    if j < i do
      fila = Enum.at(matrix, i)
      ac = acc + Enum.at(fila, j)
      sumar_diagonal(matrix, i, j + 1, ac)
    else
      sumar_diagonal(matrix, i + 1, 0, acc)
    end
  end

  def promedio(matrix), do: promedio(matrix, 0, length(matrix) - 1, 0, 0)

  def promedio(matrix, i, _, acc, n) when length(matrix) == i, do: acc / n

  def promedio(matrix, i, j, acc, n) do
    if j > i do
      fila = Enum.at(matrix, i)
      ac = acc + Enum.at(fila, j)
      promedio(matrix, i, j - 1, ac, n + 1)
    else
      promedio(matrix, i + 1, length(matrix) - 1, acc, n)
    end
  end
end

Concurrencia.main()
