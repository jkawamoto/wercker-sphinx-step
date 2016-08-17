# /bin/bash
echo "Installing Sphinx and other packages."
pip install --upgrade sphinx $WERCKER_SPHINX_PACKAGES

if [ -n "$WERCKER_SPHINX_BASEDIR" ] then

  WERCKER_SPHINX_OPTIONS = $WERCKER_SPHINX_OPTIONS" --directory "$WERCKER_SPHINX_BASEDIR

fi

echo "Compiling the document."
make $WERCKER_SPHINX_TARGET $WERCKER_SPHINX_OPTIONS
