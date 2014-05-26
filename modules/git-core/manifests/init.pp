class git-core
{
    package
    {
        "git-core":
            ensure  => latest,
            require => [Exec['ppa-apt-update']]
    }
}