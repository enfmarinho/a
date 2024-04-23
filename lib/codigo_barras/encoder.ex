defmodule Codigobarras.Encoder do
  # digito 1 a 3
  def ler_codigo_banco(lista) when is_list(lista) do
    IO.puts("Digite o código do banco: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
    case length(input) == 3 do
      true -> {:ok , input} #
      false -> {:error , "Número incorreto "}
    end

  end

  #digito 4
  def ler_moeda( lista) when is_list(lista) do

    IO.puts("Digite o código da moeda: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
    case length(input) == 1 do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end 
  end
  
  # fator de vencimento, digitos 6 a 9
  def ler_data_vencimento( lista) when is_list(lista) do
    IO.puts("Digite a data de vencimento DD/MM/AAAA: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("/" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO calcular e retornar valor de vencimento

    # TODO retornar lista
    case length(input) == 8 do
      true -> {:ok , input}
      false -> {:error , "Número incorreto"}
    end
  end
  
  # digitos 10 a 19
  def ler_valor( lista) when is_list(lista) do
    IO.puts("Digite o valor: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
    # TODO fill with 0s
    {:ok , input}
  end


  # digitos 20 a 30
  def ler_convenio(size , lista) when is_list(lista) do
    IO.puts("Digite o tipo de convênio: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
    case length(input) == size do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end
  end

  # digitos 31, 44
  def ler_dados_especificos(size , lista) when is_list(lista) do
      IO.puts("Digite os dados_especificos: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)
    # TODO retornar lista
    case length(input) == size do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end
  end


  def calcular_dv_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos) do
    # TODO
    1
  end


  def calcular_dv_campo1(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos) do
    # TODO
    1
  end

  def calcular_dv_campo2(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos) do
    # TODO
    1
  end

  def calcular_dv_campo3(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos) do
    # TODO
    1
  end

  def valor_do_boleto() do
    # TODO
  end

  def imprimir_campo_1(codigo_banco, moeda, digitos) do
  end

  def imprimir_campo_2(digitos, dados_especificos)
  end

  def imprimir_campo_3(dados_especificos)
  do

  def imprimir_campo_5(data_vencimento, valor) do
  end

  def imprimir_linha_digitavel(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos, dv) do
    "Campo 1: "|> IO.puts
    imprimir_campo_1(codigo_banco, moeda, digitos)
    "Campo 2: "|> IO.puts
    imprimir_campo_2(digitos, dados_especificos)
    "Campo 3: "|> IO.puts
    imprimir_campo_3(dados_especificos)
    "Campo 4: #{dv}" |> IO.puts
    "Campo 5: "|> IO.puts
    imprimir_campo_5(data_vencimento, valor)
  end

  def gerar_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos) do 
     # TODO
  end

  def read_all() do
    codigo_banco = ler_codigo_banco()
    moeda = ler_moeda()
    data_vencimento = ler_data_vencimento()
    valor = ler_valor()
    convenio = ler_convenio()
    dados_especificos = ler_dados_especificos()
    dv = calcular_dv_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos)
     
    imprimir_linha_digitavel(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos, dv) 
    gerar_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos, dv)
  end
end

