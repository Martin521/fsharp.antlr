module LexerTests

open Expecto
open Antlr4.Runtime
open Parser

let lex (input: string) =
    let strm = new CodePointCharStream(input)
    let lexer = new FSharpLexer(strm)
    let tokens = lexer.GetAllTokens()
    let vocab = lexer.Vocabulary
    let output (token: IToken) = $"{vocab.GetSymbolicName token.Type}({token.Text})"
    tokens |> Seq.map output |> Seq.toList

let parse(input: string) =
    let strm = new CodePointCharStream(input)
    let lexer = new FSharpLexer(strm)
    let tokens = new CommonTokenStream(lexer)
    let parser = new FSharpParser(tokens)
    let tree = parser.implementationFile()
    tree.ToStringTree(parser)

let mkTestCase f i (inText, outText) = testCase (string i) <| fun _ -> Expect.equal (f inText) outText inText

let lexerTests = [
    """ "This \is a \n\test" """, ["""RegularStringLiteral("This \is a \n\test")"""]
    "'c'", ["CharacterLiteral('c')"]
    "SomeIdentifier", ["Identifier(SomeIdentifier)"]
    """let a = 'x'""", ["LET(let)"; "Identifier(a)"; "(=)"; "CharacterLiteral('x')"]
]

let parserTests = [
    """let a = 'x'""", "(implementationFile (binding let a = 'x'))"
]

[<Tests>]
let tests = testList "AllTests" [
    testList "LexerTests" (lexerTests |> List.mapi (mkTestCase lex))
    testList "ParserTests" (parserTests |> List.mapi (mkTestCase parse))
]
