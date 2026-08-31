class Mensagem {
  final int    id;
  final String area;
  final String titulo;
  final String autor;
  final String conteudo;
  final int    visualizacoes;
  final bool   nova;
  
  const Mensagem({
    required this.id,
    required this.area,
    required this.titulo,
    required this.autor,
    required this.conteudo,
    required this.visualizacoes,
    this.nova = false,
  });
}  
  class BBs {
    final String nome;
    final String sysop;
    final int velocidadeModem;
    final List<Mensagem> mensagens;
    
    const BBs ({
      required this.nome,
      required this.sysop,
      required this.velocidadeModem,
      required this.mensagens,
  });
    
    int get totalMensagens => 0;
    
    int get totalVisualizacoes => 0;
    
    int get mensagensNovas => 0;
    
    List<String> get areas => [];
    
    List<Mensagem> mensagensDaArea(String nomeArea) {
      return[];
    }
    
    Mensagem? buscarMensagem(int id) {
      return null;
    } 
}

void imprimirCabecalho(BBs bbs) {
  print('╔-------------------╗');
  print('    BYTE LINE BBS    ');
  print('╚-------------------╝');
  print('SysOp: ');
  print('Modem: ');
  print('Mensagens:   | Novas:  ');
}

void imprimirMenu(BBs bbs) {
  print('[1] GERAL: ');
  print('[2] GAMES: ');
}

void imprimirArea(BBs bbs, String area) {
  //Listar mensagens da área recebidas
  //Mostrar: ID, indicador [novo] quando nova == true, título, autor e visualizações.
  
  //#03 [NOVO] Doom: dicas para o episodio 1
  //  por: Raven | visualizações: 42
}