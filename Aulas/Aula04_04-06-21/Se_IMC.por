programa
{
	
	funcao inicio()
	{
		real peso, altura, imc
	    
	     escreva("Informe seu peso: ") 
	     leia(peso)
	     escreva("Informe sua altura: ") 
	     leia(altura)
	     imc = peso / (altura * altura)
	    
	     se (imc < 18.5)
	     {
	        escreva("O seu IMC é ",imc," e você está abaixo do peso!")
	     }
	     senao se (imc <= 24.9)
	     {
	        escreva("O seu IMC é ",imc," e você está com peso normal!")
	     }
	     senao se (imc <= 29.9)
	     {
	        escreva("o seu IMC é ",imc," e você está com sobrepeso!")
	     }
	     senao
	     {
	        escreva("o seu IMC é ",imc," e você está com obesidade!")
	     }	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 642; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */