# I noticed the following error throughout several WP admin pages that attempt to connect to WordPress.org:-
    # "An unexpected error occurred. Something may be wrong with WordPress.org or this server’s configuration. If you continue to have problems, please try the support forums. (WordPress could not establish a secure connection to WordPress.org. Please contact your server administrator.)"
# Adding in this to the host file fixes the problem. It was also slowing down the site when logged into the admin.
# http://ryansechrest.com/2014/08/wordpress-establish-secure-connection-wordpress-org/

host { "api.wordpress.org":
    ip => "66.155.40.202",
}