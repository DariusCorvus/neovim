{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
}:

buildNpmPackage {
  pname = "markdown-toc";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "jonschlinkert";
    repo = "markdown-toc";
    rev = "1.2.0";
    hash = "sha256-CgyAxXcLrdk609qoXjyUgpA+NIlWrkBsE7lf5YnPagQ="; # To be calculated
  };

  npmDepsHash = "sha256-bC9J+8n5UEmmizkdBFYhz8k/x+h6gDnqjqUO8HHTAZw=";
  dontNpmBuild = true;
  postPatch = ''
    cp ${./package-lock.json} package-lock.json
    cp ${./package.json} package.json
  '';

  meta = with lib; {
    description = "Generate a markdown TOC (table of contents) for a README or any markdown files";
    homepage = "https://github.com/jonschlinkert/markdown-toc";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ dariuscorvus ];
  };
}
