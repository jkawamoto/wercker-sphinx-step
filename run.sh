# /bin/bash
if [ -n "$WERCKER_SPHINX_BASEDIR" ]; then
  WERCKER_SPHINX_OPTIONS=$WERCKER_SPHINX_OPTIONS" --directory "${WERCKER_SPHINX_BASEDIR}
fi

echo "Installing Sphinx and other packages."
pip install --upgrade -e git+https://github.com/sphinx-doc/sphinx@stable#egg=sphinx-stable $WERCKER_SPHINX_PACKAGES

if [ -e "requirements.txt" ]; then
  echo "Installing required packages."
  pip install -r requirements.txt
fi

echo "Compiling the document."
make $WERCKER_SPHINX_TARGET $WERCKER_SPHINX_OPTIONS
