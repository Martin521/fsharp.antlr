module LexerTests

open Expecto
open Antlr4.Runtime
open Parser

let lex (input: string) =
    let strm = new CodePointCharStream(input)
    let lexer = new FSharpLexer(strm)
    let tokens = lexer.GetAllTokens()
    let vocab = lexer.Vocabulary
    let output (token: IToken) =
        $"{vocab.GetSymbolicName token.Type}({token.Text})".Replace("\r\n", "\\r\\n ").Replace("\n", "\\n")
    tokens |> Seq.map output |> Seq.toList

let parse (input: string) =
    let strm = new CodePointCharStream(input)
    let lexer = new FSharpLexer(strm)
    let tokens = new CommonTokenStream(lexer)
    let parser = new FSharpParser(tokens)
    let tree = parser.implementationFile ()
    tree.ToStringTree(parser)

let mkTestCase f i (inText, outText) = testCase (string i) <| fun _ -> Expect.equal (f inText) outText inText

let lexerTests = [
    """ "This \is a \n\test" """, ["WS( )"; """RegularStringLiteral("This \is a \n\test")"""; "WS( )"]

    "'c'", ["CharacterLiteral('c')"]

    "SomeIdentifier", ["Ident(SomeIdentifier)"]

    """
module A
// a comment
let a = "x"
""",
    [
        "WS(\\n)"
        "MODULE(module)"
        "WS( )"
        "Ident(A)"
        "WS(\\n)"
        "Comment(// a comment)"
        "WS(\\n)"
        "LET(let)"
        "WS( )"
        "Ident(a)"
        "WS( )"
        "EQUALS(=)"
        "WS( )"
        """RegularStringLiteral("x")"""
        "WS(\\n)"
    ]
]

let parserTests = [
    """
module A
// a comment
let a = "x"
""",
    """(implementationFile (namedModule module (longIdent A) (moduleElem (moduleFunctionOrValueDefn (valueDefn let a = (expr "x"))))))"""
]

[<Tests>]
let tests =
    testList "AllTests" [
        testList "LexerTests" (lexerTests |> List.mapi (mkTestCase lex))
        testList "ParserTests" (parserTests |> List.mapi (mkTestCase parse))
    ]
