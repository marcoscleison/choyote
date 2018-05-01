use Chrest;
use ChrestWebsockets;
use ChrestUtils;

config const API_HOST: string,
             API_PORT: int,
             WS_PORT: int,
             EPOCHS: int;

class ChoyoteController: ChrestController {

}

proc main() {
  var srv = new Chrest(API_HOST,API_PORT);
  srv.Routes().setServeFiles(true);
  srv.Routes().setFilePath("www");
  var ws = new ChrestWebsocketServer(WS_PORT);

  begin srv.Listen();
  ws.Listen();
  for e in 1..EPOCHS {
    writeln("I'm really tired of these Star Wars");
  }

  ws.Close();
  srv.Close();

}
