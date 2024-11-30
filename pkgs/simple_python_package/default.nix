{ lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel  
}:

buildPythonPackage rec {
  pname = "simple_python_package";
  version = "0.1.0";  # Adjust this to match the version or commit hash

  format = "pyproject";
    
  # Fetch the source code from GitHub
  src = fetchFromGitHub {
    owner = "Open-Systems-Innovation";
    repo = "simple_python_package";
    rev = "master";  # Replace this with a specific tag or commit hash
    #sha256 = "sha256-pgUbxr9+uDY1Rk/Ee2C9h072SOpshrMcj+NjHajk2Uk=";
    sha256 = "sha256-V5L+4GJtBeepI2Hxtt8WTFDL0k1SZF9Pi+gcP17LO3M=";
  };

  # Use setuptools and wheel for the build process
  nativeBuildInputs = [
    setuptools
    wheel
  ];

  meta = with lib; {
    description = "A simple Python package that prints 'hello python package world'";
    license = licenses.mit;
    maintainers = with maintainers; [ "Open-Systems-Innovation" ]; # Add your name or other maintainers
  };
}
