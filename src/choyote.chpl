use Chrest;
use ChrestWebsockets;
use ChrestUtils;

config const API_HOST: string,
             API_PORT: int,
             WS_PORT: int,
             EPOCHS: int;

class ChoyoteController: ChrestController {
  proc Get(ref req:Request,ref res:Response) {
    //runSim();
  }

}

proc main() {
  var srv = new Chrest(API_HOST,API_PORT);
  srv.Routes().setServeFiles(true);
  srv.Routes().setFilePath("www");
  var ws = new ChrestWebsocketServer(WS_PORT);

  begin srv.Listen();
  ws.Listen();
  var choyoteController = new ChoyoteController();
  srv.Routes().Get("/data", choyoteController);

  runSim();
  
  ws.Close();
  srv.Close();

}

record AgentDTO {
  var x: real,
      y: real;
}

proc runSim() {
  for i in 1..EPOCHS {
    var a = new AgentDTO(x=i:real / EPOCHS, y=i:real/EPOCHS);
    chrestPubSubPublish("data", a);
  }
}
