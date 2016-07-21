# Base docker container for Redmine 

## Setup

> git clone https://repo_url
>
> git submodule update --init --recursive
>
> cp .env.example .env
>
> docker-compose up -d
>
> ./redmine-setup.sh
>
> docker-compose restart

### Add theme

> sudo mount --bind /path_to_docker-redmine/themes-available/theme_name /path_to_docker-redmine/themes-enabled/theme_name
>
> docker-compose restart

### Add plugin

> sudo mount --bind /path_to_docker-redmine/plugin-available/plugin_name /path_to_docker-redmine/plugin-enabled/plugin_name
>
> ./redmine-setup.sh
>
> docker-compose restart
