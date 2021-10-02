programa {
	funcao inicio() {
		//Calcular imc
		 real altura, peso, imc 
		 
		 escreva("Digite sua altura: ")
		 leia(altura)
		 escreva("Digite seu peso: ")
		 leia(peso)
		 imc = peso/(altura * altura)
		 
		 escreva("O seu IMC é ", imc)
	}
}
