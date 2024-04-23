defmodule Codigobarras.Decoder do
  def read() do
    # TODO return a list with 44 ints
  end
  def split_informacoes(list) do
    [head | tail] = Enum.split(list, 3)
    codigo_banco = head
    [head | tail] = Enum.split(tail, 1)
    moeda = head
    [head | tail] = Enum.split(tail, 1)
    dv = head
    [head | tail] = Enum.split(tail, 4)
    data_vencimento = head
    [head | tail] = Enum.split(tail, 10)
    valor = head
    [head | tail] = Enum.split(tail, 11)
    convenio = head
    dados_especificos = tail
  end
  def imprimir_codigo_banco(codigo_banco) do
    "Codigo do banco: " |> IO.write
    codigo_banco |> IO.inspect
  end
  def imprimir_moeda(moeda) do
    "moeda: " |> IO.write
    moeda |> IO.inspect
  end
  def imprimir_data_vencimento(data_vencimento) do 
    "data_vencimento: " |> IO.write
    data_vencimento |> IO.inspect
  end
  def imprimir_valor() do
    "Valor: " |> IO.write
    valor |> IO.inspect
  end
  def imprimir_tipos_convenio(convenio) do
    "Convenio: " |> IO.write
    convenio |> IO.inspect
  end
  def imprimir_dados_especificos(dados_especificos) do
    "Dados especificos: " |> IO.write
    dados_especificos |> IO.inspect
  end
end
