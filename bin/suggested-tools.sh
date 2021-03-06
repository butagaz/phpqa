#!/bin/sh

# Usage:
#  $ bin/suggested-tools.sh install
#  $ bin/suggested-tools.sh install --update-no-dev
#  $ bin/suggested-tools.sh remove

mode="$1"
requireMode="$2"

if [ $mode = "install" ]
then
    echo "Installing suggested tools"
    if [ ! -z "$requireMode" ]; then
        # docker build OR travis + php 7.0 OR symfony2 (default composer.lock)
        composer require symfony/filesystem:~2 symfony/process:~2 symfony/finder:~2 jakub-onderka/php-parallel-lint jakub-onderka/php-console-highlighter phpstan/phpstan:~0.12.0 nette/neon friendsofphp/php-cs-fixer:~2.2 vimeo/psalm:~1 enlightn/security-checker $requireMode
    else
        # symfony 3
        composer require jakub-onderka/php-parallel-lint jakub-onderka/php-console-highlighter phpstan/phpstan nette/neon friendsofphp/php-cs-fixer:~2.2 vimeo/psalm enlightn/security-checker
    fi
else
    echo "Removing suggested tools"
    composer remove jakub-onderka/php-parallel-lint jakub-onderka/php-console-highlighter phpstan/phpstan friendsofphp/php-cs-fixer vimeo/psalm enlightn/security-checker
fi
