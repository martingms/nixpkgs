{ stdenv, fetchFromGitHub, pythonPackages, mopidy }:

pythonPackages.buildPythonApplication rec {
  name = "mopidy-scrobbler-${version}";

  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "mopidy";
    repo = "mopidy-scrobbler";
    rev = "v${version}";
    sha256 = "0p4gm5ciqnqz4swnks7zg3p91mjycl7hgqd3by5308lqg32pfwbg";
  };

  propagatedBuildInputs = [ mopidy pythonPackages.pylast ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Mopidy extension for scrobbling played tracks to Last.fm";
    license = licenses.asl20;
    maintainers = [ maintainers.spwhitt ];
  };
}
