unit RealState.Agent.Controller;

interface

uses
  MVCFramework,
  MVCFramework.Commons,
  JsonDataObjects;

type
  [MVCPath('/api/agents')]
  TAgentController = class(TMVCController)
  public
    [MVCPath('/')]
    [MVCHTTPMethod([httpGET])]
    procedure GetAgents;
  end;

implementation

uses
  System.StrUtils,
  System.SysUtils,
  RealState.Agent.Repository;

procedure TAgentController.GetAgents;
var
  repository: TAgentRepository;
begin
  Writeln(Context.Request.PathInfo);
  repository := TAgentRepository.Create(nil);
  try
    Render(repository.GetAgents);
  finally
    repository.Free;
  end;
end;

end.
