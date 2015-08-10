# Load OS-dependent settings
case $OSTYPE in
    darwin*)
        . $ZDOTDIR/.zprofile.Darwin
        ;;
    linux*)
        . $ZDOTDIR/.zprofile.Linux
        ;;
    cygwin*)
        . $ZDOTDIR/.zprofile.Cygwin
        ;;
esac
