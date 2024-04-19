### Algoritmo para o gerador

Aqui foi tirado de uma página no github https://github.com/caelum/caelum-s_43(34),%20do:%20[@shift_slash,%20?B]%20defp%20ascii_to_43(35),%20do:%20[@shift_slash,%20?C]%20defp%20ascii_to_43(36),%20do:%20[?$]%20defp%20ascii_tella/blob/master/stella-boleto/src/main/java/br/com/caelum/stella/boleto/bancos/GeradorDeLinhaDigitavel.java


### Isso é um esbouço 

```C 
// 44 é o número que transforma em código de barras 
if (código_barras != 44){ 
    return 0; //retorne erro (código de barras precisa de 44 dígitos )
} 

// Agora devemos ler na ordem especificada pela febraban 

/*
2.3 Leiaute do Código de Barras
2.3.1 Tipo:
a) Deve ser utilizado o tipo “2 de 5 intercalado” que tem as seguintes
características:
b) Cinco barras definem um caractere, sendo duas delas, barras largas;
c) “Intercalado” significa que os espaços entre as barras também têm
significado de maneira análoga às barras; d) Define apenas caracteres
numéricos. 
*/

/* 
2.3.2 Conteúdo:
a) O código de barras é composto por dois campos:
b) campo obrigatório: determinado pela FEBRABAN e comum a todos dos
bancos;
c) campo livre: determinado por cada banco de acordo com a modalidade de
Cobrança utilizada pelo cliente;
d) Deve conter 44 posições, disposto da seguinte forma: 
*/

//Seguindo a tabela da febraban 
//posição de 01 a 03 = Código do Banco na Câmara de Compensação = '001' 
//devemos tratar o diferente?????
int pos1a3 = 001;
//tem que ter 4 dígitos 

//posição 04 a 04 é o código da moeda não é necessário tratar o erro de um dígito diferente de 9 mas podemos tratar para ser realista, o único tratamento é caso não seja número e seja um char 
int pos04 = 9; //real 

int pos05 = x; //dígito verificador do código de barras *( no final eu vou especificar como que se calcula) Anexo V

int pos0609 = y; //fator de vencimento **(mesma coisa do de cima) Anexo III
// tem que ter 4 dígitos 

int pos1019 = valor; //valor numérico tem que ter tamanho 10

int pos2044 = valor_livre; //Campo livre específico do BB Anexo VI VII X e IX

// Após ler tudo isso e tratando os erros deu certo 

int arr [ 'pos1a3' + 'pos04' + 'pos05' + 'pos0609' + 'pos1019' + 'pos2044' ]
printf(sizeof(arr));// == 44 ints ou chars tanto faz  

/*

Agora vamos supor que já scaneamos os 44 dígitos do código de barras, e já tratamos os erros (top)!!!! 
    
Com o código do boleto de 44 dígitos podemos fazer duas coisas:
    1 -> Jogar na biblioteca para transformar em PNG ou jogar na biblioteca que podemos criar. 

    2 -> Produzir a linha digitável com os 47 dígitos 



ATENÇÃO !!!!!!
Como dito alí em cima SEGUE OS ANEXOS

Anexo V é sobre o DV precisa de uma função específica 

Anexo IV é sobre o fator de vencimento precisa de uma função específica 

Do Anexo IV até a última página é o método para construção desses números 


Sr. Eduardo, por favor mexa, complete e modifique esse readme.md
*/

```

Finalizado, ainda falta mais coisa.

