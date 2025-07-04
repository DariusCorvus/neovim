self: super: {
  tree-sitter-surrealdb = super.tree-sitter.buildGrammar {
    language = "surrealdb";
    src = super.fetchFromGitHub {
      owner = "DariusCorvus";
      repo = "tree-sitter-surrealdb";

      rev = "main"; # You can pin a commit for reproducibility
      # Replace below with actual hash or use lib.fakeSha256 for testing
      sha256 = "0000000000000000000000000000000000000000000000000000";
    };
    files = [ "src/parser.c" ];
  };
}
