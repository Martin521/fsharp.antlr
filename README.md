# fsharp.antlr

#### 2024-04-02
I am quite enthusiastic about ANTLR4 in the F# context.

The ANTLR4 .net runtime (irritatingly labelled "C#" or "Standard") (`Antlr4.Runtime.Standard` on nuget) works great with F#.
The other great piece of support are `Antlr4BuildTasks`, also on nuget.

Once you have found and understood all the pieces of the puzzle, it is quite simple, as you can see in this repo. The grammar describes a tiny piece of F#. The parser is automatically rebuilt when you add or change a test.

If you want to quickly try things out, just clone this repo with VS Code DevContainers and run `dotnet run --project Test`.

#### 2024-03-20
For now, I am trying to understand ANTLR and its potential in the context of the F# spec. This might develop into a project to create a F# ANTLR grammar.
