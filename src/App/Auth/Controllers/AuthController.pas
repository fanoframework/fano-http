(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit AuthController;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /auth
     *
     * See Routes/Auth/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TAuthController = class(TAbstractController)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader
        ) : IResponse; override;
    end;

implementation

uses

    sysutils;

    function TAuthController.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader
    ) : IResponse;
    var
        postParams : IReadOnlyList;
        i : integer;
        keyName : string;
        respBody : IResponseStream;
    begin
        respBody := response.body();
        respBody.write('<html><head><title>Auth controller</title></head><body>');
        respBody.write('<h1>Auth controller</h1>');
        respBody.write('<ul>');
        postParams := request.parsedBodyParams;
        for i := 0 to postParams.count() - 1 do
        begin
            keyName := postParams.keyOfIndex(i);
            respBody.write(
                format(
                    '<li>%s=%s</li>',
                    [
                        keyName,
                        request.getParsedBodyParam(keyName)
                    ])
            );
        end;
        respBody.write('</ul></body></html>');
        result := response;
    end;

end.
