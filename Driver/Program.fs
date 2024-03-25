open Antlr4.Runtime
open Parser
open System.IO

type ErrorListener<'T>() =
    inherit ConsoleErrorListener<'T>()
    let mutable hadError = false
    member x.HadError = hadError
    override _.SyntaxError(output: TextWriter, recognizer: IRecognizer, offendingSymbol: 'T, line: int,
                            col: int, msg: string, e: RecognitionException) =
        hadError <- true;
        base.SyntaxError(output, recognizer, offendingSymbol, line, col, msg, e);


let Try (input: string) =
    let str = new AntlrInputStream(input)
    System.Console.WriteLine(input)
    let lexer = new ArithmeticLexer(str)
    let tokens = new CommonTokenStream(lexer)
    let parser = new ArithmeticParser(tokens)
    let listener_lexer = new ErrorListener<int>()
    let listener_parser = new ErrorListener<IToken>()
    lexer.RemoveErrorListeners()
    parser.RemoveErrorListeners()
    lexer.AddErrorListener(listener_lexer)
    parser.AddErrorListener(listener_parser)
    let tree = parser.file()
    if (listener_lexer.HadError || listener_parser.HadError) then
        System.Console.WriteLine("error in parse.")
    else
        System.Console.WriteLine("parse completed.")
    System.Console.WriteLine(tree.ToStringTree(parser))

Try("1 + 2 + 3")
Try("1 2 + 3")
Try("1 + +")
