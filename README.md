# API IMC

## Requisitos Necessários:

* Ruby 3.0.2
* PostgreSQL
* Rails 6

- Cálculo do imc com o valor do resultado, a classificação e o grau de obesidade.

![ScreenShot](https://github.com/beto-machado/RH-Software---Teste/blob/master/app/img/calculo_imc.png)


## Para executar o projeto:

### Clone em sua máquina

```shell
git clone https://github.com/beto-machado/RH-Software---Teste.git
```

### Instale as dependências
```shell
bundle install
```

### Crie o Banco de Dados
```shell
rails db:create
rails db:migrate
```

### Execute a aplicação
```shell
rails s
