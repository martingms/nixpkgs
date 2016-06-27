{ stdenv, fetchFromGitHub, pythonPackages, mopidy }:

pythonPackages.buildPythonApplication rec {
  name = "mopidy-scrobbler-${version}";

  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "mopidy";
    repo = "mopidy-scrobbler";
    rev = "v${version}";
    sha256 = "1429yvfkkq38wl9chqrp81vmi6x2hfr2q02cc7vgryx90c5irhbj";
  };

  propagatedBuildInputs = [ mopidy ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Mopidy extension for scrobbling played tracks to Last.fm";
    license = licenses.asl20;
    maintainers = [ maintainers.spwhitt ];
  };
}
