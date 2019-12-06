source common.sh

function install_macos_homebrew(){
    if [ "$(is_installed "brew help")" == "yes" ]; then
        echo "brew is already installed, skipping install"
        return
    fi
    install_message "Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function install_macos_go(){
    if [ "$(is_installed "go version")" == "yes" ]; then
        echo "go is already installed, skipping install"
        return
    fi
    install_message "Go"
    brew install go
}

function install_macos_docker(){
    if [ "$(is_installed "docker --version")" == "yes" ]; then
        echo "docker is already installed, skipping install"
        return
    fi
    install_message "Docker"
    brew cask install docker
}

function install_macos_gcloud() {
    if [ "$(is_installed "gcloud --version")" == "yes" ]; then
        echo "gcloud is already installed, skipping install"
        return
    fi
    install_message "Google Cloud SDK"
    brew cask install google-cloud-sdk
}


function bootstrap_macos() {
    install_macos_homebrew
    install_macos_go
    install_macos_docker
    install_macos_gcloud

    fix_git_for_go_get
    configure_docker_credentials
}
