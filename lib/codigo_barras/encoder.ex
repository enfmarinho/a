defmodule Codigobarras.Encoder do
  # digito 1 a 3
  defp ler_codigo_banco() do
    codigo_banco = IO.gets("Digite o código do banco: ")
      |> String.trim()
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)

    case codigo_banco do
      #
      3 -> {:ok, codigo_banco}
      _ -> {:error, "Código inválido "}
    end
  end

  # digito 4
  defp ler_moeda() do
    moeda = IO.gets("Digite o código da moeda: ")
      |> String.trim()
      |> String.to_integer()

    case moeda do
      9 -> {:ok, moeda}
      _ -> {:error, "Código inválido "}
    end
  end

  # Função funcionando e testada
  defp ler_data do
    data =
      IO.gets("Digite a data de vencimento no formato DD-MM-AAAA: ")
      |> String.trim()
      |> String.split("-")

    case data do
      [day_str, month_str, year_str] when length(data) == 3 ->
        dia = String.to_integer(day_str)
        month = String.to_integer(month_str)
        year = String.to_integer(year_str)

        data_atual = Timex.Date.new!(year, month, dia)
        # IO.puts(data_atual)
        # {:ok, data_atual}

        data_fixa = ~D[2000-07-03]
        figas = Timex.diff(data_atual, data_fixa, :days)
        # IO.puts("Diferença: #{figas}")
        fator = figas + 1000
        {:ok, fator}

      _ ->
        {:error, "Formato de data inválido"}
    end
  end

  defp fator_de_vencimento() do #função testada e aprovada com retorno {:ok , fator de vencimento}
    fator = ler_data()

    case fator do
      _ -> fator
    end
  end

  # digitos 10 a 19
  defp ler_valor() do
    valor = IO.gets("Digite o valor do boleto: ")
      |> String.trim()
      |> String.replace(".", "")
      |> String.pad_leading(10,"0") #caso precise de uma lista de inteiros basta fazer um Enum.map

    case String.length(valor) do
      10 -> {:ok, valor}
      _ -> {:error, "Valor inválido "}
    end
  end

  # digitos 20 a 30
  defp ler_convenio() do

    convenio = IO.gets("Digite o número do convênio: ")
    |> String.trim()
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
     case length(convenio)do
       4 -> {:ok , convenio}
       _ -> {:error , "Número incorreto "}
     end
  end

  # digitos 31, 44
  defp ler_dados_especificos() do

    complemento = IO.gets("Digite os dados específicos como Complemento, Agência, Conta e Carteira:  ")
    |> String.trim()
    |> String.split("", trim: true)
    |> String.replace(" ", "")
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
     case length(complemento) do
       21 -> {:ok , complemento}
       _ -> {:error , "Número incorreto "}
     end
  end


  defp calcular_dv_codigo_barra(
         codigo_banco,
         moeda,
         data_vencimento,
         valor,
         convenio,
         dados_especificos
       ) do
    # TODO retornar dv do codigo de barras
    1 # TODO Delete this, just a stub
  end

  defp calcular_dv_campos(campo) do
    aux = aux_calcular_dv(Enum.reverse(campo), true)
    dezena_imediatament_maior = :math.ceil(aux / 10) 
    dezena_imediatament_maior * 10 - aux
  end

  defp aux_calcular_dv([]), do: 0
  defp aux_calcular_dv(campo, dobro) do
    [head | tail] = campo
    if dobro do
      atual = 2 * head
      if atual >= 10 do
        (atual - 10) + 1 + aux_calcular_dv(tail, false)
      else 
        atual + aux_calcular_dv(tail, false)
      end
    else 
      head + aux_calcular_dv(tail, true)
    end
  end

  defp imprimir_campo_1(codigo_banco, moeda, digitos) do
    digitos_utilizados = Enum.take(digitos, 5)
    campo1 = codigo_banco ++ [moeda] ++ digitos_utilizados
    
    {antes_ponto, depois_ponto} = Enum.split(campo1, 5)
    antes_ponto |> IO.inspect
    "." |> IO.write
    depois_ponto |> IO.inspect
    calcular_dv_campos(campo1) |> IO.write()
    " " |> IO.write
  end

  defp imprimir_campo_2(convenio, dados_especificos) do
    { _, convenio_usados} = Enum.split(convenio, 5)
    { _, dados_especificos_usados} = Enum.split(dados_especificos, 4)
    campo2 = convenio_usados ++ dados_especificos_usados

    {antes_ponto, depois_ponto} = Enum.split(campo2, 5)
    antes_ponto |> IO.inspect
    "." |> IO.write
    depois_ponto |> IO.inspect
    calcular_dv_campos(campo2) |> IO.write
    " " |> IO.write
  end

  defp imprimir_campo_3(dados_especificos) do
    {_, dados_especificos_usados} = Enum.split(dados_especificos, 4)
    campo3 = dados_especificos_usados
    {antes_ponto, depois_ponto} = Enum.split(campo3, 5)
    antes_ponto |> IO.inspect
    "." |> IO.write
    depois_ponto |> IO.inspect
    calcular_dv_campos(campo3) |> IO.write()
    " " |> IO.write
  end

  defp imprimir_campo_5(data_vencimento, valor) do
    data_vencimento |> IO.inspect()
    valor |> IO.inspect()
    " " |> IO.write()
  end

  defp imprimir_linha_digitavel(
         codigo_banco,
         moeda,
         data_vencimento,
         valor,
         convenio,
         dados_especificos,
         dv
       ) do
    "Linha digital: " |> IO.write()
    imprimir_campo_1(codigo_banco, moeda, convenio)
    imprimir_campo_2(convenio, dados_especificos)
    imprimir_campo_3(dados_especificos)
    "#{dv} " |> IO.write()
    imprimir_campo_5(data_vencimento, valor)
  end

  defp gerar_codigo_barra(
         codigo_banco,
         moeda,
         data_vencimento,
         valor,
         convenio,
         dados_especificos,
         dv
       ) do
    # TODO gerar png com o codigo de barra
  end

  def ler_registros() do
    codigo_banco = ler_codigo_banco()
    moeda = ler_moeda()
    data_vencimento = fator_de_vencimento()
    valor = ler_valor()
    convenio = ler_convenio()
    dados_especificos = ler_dados_especificos()

    dv =
      calcular_dv_codigo_barra(
        codigo_banco,
        moeda,
        data_vencimento,
        valor,
        convenio,
        dados_especificos
      )

    imprimir_linha_digitavel(
      codigo_banco,
      moeda,
      data_vencimento,
      valor,
      convenio,
      dados_especificos,
      dv
    )

    gerar_codigo_barra(
      codigo_banco,
      moeda,
      data_vencimento,
      valor,
      convenio,
      dados_especificos,
      dv
    )
  end
end
