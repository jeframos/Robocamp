# Para o comando abaixo funcionar, será necessário alterar no arquivo (/resources/pages/login.resource)
# o comando    (New Browser    headless=false    browser=webkit)
# alterar para (New Browser    headless=false    browser=BROWSER)
#
# O parametro '-v' informado abaixo serve para indicar no prompt de comando que 'BROWSER' é
# uma variavel, e está guardando o valor 'webkit'
#
# Para conseguir rodar os testes com essa configuração, será necessário executar no prompt
# o seguinte processo 'chmod +x chrome.sh' caso seja a primeira vez para o terminal dar permissão 
# para esse arquivo '.sh', se não pode executar o proximo comando.
#
# Comando de execução dos testes configurados abaixo './chrome.sh'

robot -d ./logs -v BROWSER:webkit tests

