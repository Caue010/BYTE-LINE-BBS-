class Mensagem {
  final int id;
  final String area;
  final String titulo;
  final String autor;
  final String conteudo;
  final int visualizacoes;
  final bool nova;

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

  const BBs({
    required this.nome,
    required this.sysop,
    required this.velocidadeModem,
    required this.mensagens,
  });

  int get totalMensagens => mensagens.length;

  int get totalVisualizacoes {
    int total = 0;
    for (final m in mensagens) {
      total += m.visualizacoes;
    }
    return total;
  }

  int get mensagensNovas {
    int total = 0;
    for (final m in mensagens) {
      if (m.nova) total++;
    }
    return total;
  }

  List<String> get areas {
    final List<String> resultado = [];
    for (final m in mensagens) {
      if (!resultado.contains(m.area)) {
        resultado.add(m.area);
      }
    }
    return resultado;
  }

  List<Mensagem> mensagensDaArea(String nomeArea) {
    return mensagens
        .where((m) => m.area.toLowerCase() == nomeArea.toLowerCase())
        .toList();
  }


  Mensagem? buscarMensagem(int id) {
    for (final m in mensagens) {
      if (m.id == id) return m;
    }
    return null;
  }
}

void imprimirCabecalho(BBs bbs) {
  print('       ╔-----------------------------------------╗');
  print('                    ${bbs.nome.toUpperCase()}');
  print('       ╠-----------------------------------------╣');
  print('         SysOp: ${bbs.sysop}');
  print('         Modem: ${bbs.velocidadeModem} bps');
  print('         Mensagens: ${bbs.totalMensagens} | Novas: ${bbs.mensagensNovas}');
}

void imprimirMenu(BBs bbs) {
  print('       ╠-----------------------------------------╣');
  print('                ÁREAS DISPONÍVEIS');
  print('');
  final areas = bbs.areas;
  for (int i = 0; i < areas.length; i++) {
    final area = areas[i];
    final qtd = bbs.mensagensDaArea(area).length;
    final rotulo = qtd == 1 ? 'mensagem' : 'mensagens';
    print('         [${i + 1}] ${area.padRight(12)} - $qtd $rotulo');
  }
}

void imprimirArea(BBs bbs, String area) {
  print('       ╠-----------------------------------------╣');
  print('               --- ÁREA: ${area.toUpperCase()} ---');
  print('');
  final mensagensDaArea = bbs.mensagensDaArea(area);
  for (final m in mensagensDaArea) {
    final idFormatado = m.id.toString().padLeft(2, '0');
    final marcador = m.nova ? '[NOVO] ' : '';
    print('           #$idFormatado $marcador${m.titulo}');
    print('           por: ${m.autor} | visualizações: ${m.visualizacoes}');
  }
}

void imprimirMensagem(BBs bbs, int id) {
  final m = bbs.buscarMensagem(id);
  if (m == null) {
    print('       Mensagem #$id não encontrada.');
    return;
  }
  final idFormatado = m.id.toString().padLeft(2, '0');
  print('       ╠-----------------------------------------╣');
  print('                --- MENSAGEM #$idFormatado ---');
  print('');
  print('          Título: ${m.titulo}');
  print('          Autor: ${m.autor}');
  print('          Área: ${m.area}');
  print('          Visualizações: ${m.visualizacoes}');
  print('       ------------------------------------------');
  print('   ${m.conteudo}');
}

void imprimirEstatisticas(BBs bbs) {
  print('       ╠-----------------------------------------╣');
  print('                 --- ESTATÍSTICAS ---');
  print('          Áreas: ${bbs.areas.length}');
  print('          Mensagens: ${bbs.totalMensagens}');
  print('          Mensagens novas: ${bbs.mensagensNovas}');
  print('          Visualizações: ${bbs.totalVisualizacoes}');
}

void main() {
  final bbs = BBs(
    nome: 'Byte Line BBS',
    sysop: 'Morgan',
    velocidadeModem: 18800,
    mensagens: const [
      Mensagem(
        id: 1,
        area: 'GERAL',
        titulo: 'Bem-vindo à Byte Line BBS!',
        autor: 'Morgan',
        conteudo: 'Sejam todos bem-vindos ao nosso quadro de mensagens.',
        visualizacoes: 50,
      ),
      Mensagem(
        id: 2,
        area: 'GERAL',
        titulo: 'Regras de conduta',
        autor: 'SysOp',
        conteudo: 'Respeite os demais usuários e evite mensagens duplicadas.',
        visualizacoes: 30,
        nova: true,
      ),
      Mensagem(
        id: 3,
        area: 'GAMES',
        titulo: 'Doom: dicas para o episódio 1',
        autor: 'Raven',
        conteudo: 'Guarde as chaves coloridas e explore bem cada fase.',
        visualizacoes: 42,
        nova: true,
      ),
      Mensagem(
        id: 4,
        area: 'GAMES',
        titulo: 'SimCity 2000 - estratégias iniciais',
        autor: 'Vector',
        conteudo:
            'Comece pequeno, controle os gastos e não expanda a cidade rápido demais.',
        visualizacoes: 64,
      ),
      Mensagem(
        id: 5,
        area: 'TECNOLOGIA',
        titulo: 'Novidades em modems 33.6k',
        autor: 'Chip',
        conteudo: 'Os novos modems prometem conexões ainda mais estáveis.',
        visualizacoes: 76,
        nova: true,
      ),
      Mensagem(
        id: 6,
        area: 'DOWNLOADS',
        titulo: 'Compilado de shareware de agosto',
        autor: 'Neo',
        conteudo: 'Novo pacote de jogos shareware disponível para download.',
        visualizacoes: 40,
      ),
    ],
  );

  print('          Discando...');
  print('          CONNECT ${bbs.velocidadeModem}');
  print('');

  imprimirCabecalho(bbs);
  print('');

  imprimirMenu(bbs);
  print('');

  imprimirArea(bbs, 'DOWNLOADS');
  print('');

  imprimirMensagem(bbs, 6);
  print('');

  imprimirEstatisticas(bbs);
  print('');

  print('          NO CARRIER');
}
