self: super: {
  tree-sitter-surrealdb = super.tree-sitter.buildGrammar {
    language = "surrealdb";
    version = "0.1.0";
    src = super.fetchFromGitHub {
      owner = "DariusCorvus";
      repo = "tree-sitter-surrealdb";

      rev = "main"; # You can pin a commit for reproducibility
      # Replace below with actual hash or use lib.fakeSha256 for testing
      sha256 = "05fk80mmhdiyc8nyh1l6zpj9g89cjq6m0cd6jz8f45ha8jagj5gz";
    };
    files = [ "src/parser.c" ];
  };
  tree-sitter-grammars = super.tree-sitter-grammars // {
    surrealdb = self.tree-sitter-surrealdb;
  };
}
